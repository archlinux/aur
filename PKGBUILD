# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=wannier90
pkgver=3.0.0
pkgrel=1
pkgdesc="Compute maximally-localised Wannier functions (MLWFs)."
arch=('i686' 'x86_64')
url="http://www.wannier.org"
license=('GPL')
depends=('lapack' 'blas')
makedepends=('gcc-fortran')
optdepends=()
source=(https://github.com/wannier-developers/wannier90/archive/v$pkgver.tar.gz)
sha256sums=('f196e441dcd7b67159a1d09d2d7de2893b011a9f03aab6b30c4703ecbf20fe5b')
options=(staticlibs)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp config/make.inc.gfort make.inc

  make all
}

package() {

  cd "$srcdir/$pkgname-$pkgver"

  for binary in wannier90.x postw90.x w90chk2chk.x; do
      install -Dm755 "$srcdir/$pkgname-$pkgver/$binary" "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 "$srcdir/$pkgname-$pkgver/libwannier.a" "$pkgdir/usr/lib/libwannier.a"

}
