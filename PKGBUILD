# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-extutils-cppguess
pkgver=0.09
pkgrel=1
pkgdesc="ExtUtils::CppGuess - guess C++ compiler and flags"
arch=('any')
url="https://metacpan.org/release/ExtUtils-CppGuess/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-capture-tiny')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${pkgver}.tar.gz")
md5sums=('f8ada38ee4ad86a4f1e20d8525ce0c99')

prepare() {
  export _src_dir="$srcdir/ExtUtils-CppGuess-$pkgver"
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
