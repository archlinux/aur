# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-build-plugin-pkgconfig-ppwrapper
_dist=Alien-Build-Plugin-PkgConfig-PPWrapper
pkgver=0.03
pkgrel=6
pkgdesc='Alien::Build plugin to ensure the pure perl PkgConfig is not run by the MSYS perl'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz")
sha256sums=('9ebe5ae347f7ab4c18e4694d7f568635a9045289841273133a83d75d20c6527a')

arch=(any)
depends=(
  perl
  perl-alien-build
  perl-path-tiny
)
checkdepends=(
  perl-capture-tiny
  perl-data-dump
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
