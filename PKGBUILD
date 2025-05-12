# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>

pkgname=perl-aptpkg
pkgver=0.1.41
pkgrel=1
pkgdesc="A Perl interface to APT's libapt-pkg"
_dist=libapt-pkg-perl
arch=('x86_64')
url="https://salsa.debian.org/bod/libapt-pkg-perl"
license=('GPL3')
depends=(perl apt)
options=(!emptydirs purge)
source=("https://salsa.debian.org/bod/$_dist/-/archive/v$pkgver/$_dist-v$pkgver.tar.gz")
sha256sums=('dd7d7ee9432d0c75eae9a3a02a214ddd1d1c038a468e82819dd83b090e20e654')

build() {
  cd "$srcdir/$_dist-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_dist-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

