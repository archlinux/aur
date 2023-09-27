# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>

pkgname=perl-aptpkg
pkgver=0.1.40
pkgrel=1
pkgdesc="A Perl interface to APT's libapt-pkg"
_dist=libapt-pkg-perl
arch=('x86_64')
url="https://salsa.debian.org/bod/libapt-pkg-perl"
license=('GPL3')
depends=(perl apt)
options=(!emptydirs purge)
source=("https://salsa.debian.org/bod/$_dist/-/archive/v$pkgver/$_dist-v$pkgver.tar.gz")
sha256sums=(048617a2f03bc48ba22253e14d9242c25c03d192af11116a0f026ffda034ff29)

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

