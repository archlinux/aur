# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-sqlite
_dist=Alien-sqlite
pkgver=1.07
pkgrel=6
pkgdesc='Compile the Sqlite library'

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=('09ab5ea452b73749ef8ad6a07bdeb2e0b726d7d1509fe9236dcb10b48006caa9')

arch=(any)
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=(
  perl
  perl-alien-build
  perl-file-find-rule
  perl-pkgconfig
  perl-sort-versions
)
checkdepends=(
  perl-ffi-checklib
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
