# Maintainer: Alberto Sánchez Molero <alsamolero@gmail.com>

pkgname=perl-aptpkg
pkgver=0.1.36
pkgrel=1
pkgdesc="A Perl interface to APT's libapt-pkg"
_dist=libapt-pkg-perl
arch=('x86_64')
url="https://salsa.debian.org/bod/libapt-pkg-perl"
license=('GPL3')
depends=(perl apt)
options=('!emptydirs' purge)
source=("https://salsa.debian.org/bod/$_dist/-/archive/v$pkgver/$_dist-v$pkgver.tar.gz")
sha256sums=(83559eb7281e1cfbf0e3aaae48c27f8d542e3a1ddfe6c2bba3e38b22583b251a)

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

