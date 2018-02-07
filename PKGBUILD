# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=wannier90
pkgver=2.1.0
pkgrel=1
pkgdesc="Compute maximally-localised Wannier functions (MLWFs)."
arch=('i686' 'x86_64')
url="http://www.wannier.org"
license=('GPL')
depends=('lapack' 'blas')
makedepends=('gcc-fortran')
optdepends=()
source=(http://www.wannier.org/code/$pkgname-$pkgver.tar.gz)
sha1sums=('40cf6607b5a8b960482251ba747382fbe0106f59')
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
