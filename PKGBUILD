# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=wannier90
pkgver=3.1.0
pkgrel=1
pkgdesc="Compute maximally-localised Wannier functions (MLWFs)."
arch=('i686' 'x86_64')
url="http://www.wannier.org"
license=('GPL')
depends=('lapack' 'blas')
makedepends=('gcc-fortran')
optdepends=()
source=(https://github.com/wannier-developers/wannier90/archive/v$pkgver.tar.gz)
sha256sums=('40651a9832eb93dec20a8360dd535262c261c34e13c41b6755fa6915c936b254')
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
