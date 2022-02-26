# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=tksvg
pkgver=0.9
pkgrel=1
pkgdesc="An extension for Tk to read SVG images based on nanosvg"
url="https://github.com/oehhar/tksvg/"
arch=('x86_64')
license=('custom')
depends=('tk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oehhar/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('f185d3574b11eefbab58a78c0f563c0f09fe1e4f6271cf7c707de78ba4f09493b3dd055a60872ed5f30448cad8c10403c9c72532669868aa1a274386da885a1f')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-64bit
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/license.terms"
  make install DESTDIR="$pkgdir"

  # Remove empty directories
  rmdir "$pkgdir/usr/include" "$pkgdir/usr/bin"
}
