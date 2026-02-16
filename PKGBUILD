# Maintainer: abby <abby+aur@stellardrift.ca>
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=tksvg
pkgver=0.16
pkgrel=1
pkgdesc="An extension for Tk to read SVG images based on nanosvg"
url="https://github.com/oehhar/tksvg/"
arch=('x86_64')
license=('custom')
depends=('tk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oehhar/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('c7eb7cfd8bbdbc08138a44b92e43ca29fdbe4e6c95abdcdbe7e6ce2b3a764fcaf62eb4541286236ebeab7d899480371473ade46aab54aec8528b23e312a78c89')

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
