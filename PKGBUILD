# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-extutils-makemaker-aur
pkgver=7.12
pkgrel=1
pkgdesc="ExtUtils::MakeMaker - Create a module Makefile"
arch=('any')
url="https://metacpan.org/release/ExtUtils-MakeMaker/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=(perl-extutils-makemaker=${pkgver})
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://www.cpan.org/authors/id/B/BI/BINGOS/ExtUtils-MakeMaker-${pkgver}.tar.gz")
md5sums=('c6c586a957d7cdb66f5c55247c529bf9')

prepare() {
  export _src_dir="$srcdir/ExtUtils-MakeMaker-$pkgver"
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

