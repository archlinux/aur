# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-constant-defer
pkgver=6
pkgrel=1
pkgdesc="constant::defer -- constant subs with deferred value calculation"
arch=('any')
url="https://metacpan.org/release/constant-defer/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/constant-defer-${pkgver}.tar.gz")
md5sums=('6af9912fa420340e9e171ac81f450492')

prepare() {
  export _src_dir="$srcdir/constant-defer-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
