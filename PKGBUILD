# Maintainer: Katie Wolfe <wolfe@katie.host>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=fennel
pkgver=1.0.0
pkgrel=1
pkgdesc="A Lua Lisp language"
arch=('any')
url="https://fennel-lang.org"
license=('MIT')
depends=('lua')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~technomancy/fennel/archive/$pkgver.tar.gz")
sha512sums=('4ad1635807d244297fdc7bf7c06568ae708ae805dcaac2bb190fad412da21c9e3c3b86a6afa223e343488c725afea94682f213332fb22ba66eb5190e97f18415')
b2sums=('07758493c8c96d2d5151a1cb38da9fec002eb2522926dc2cad0a125c3e608daf2035a3d21743a8634a5fd0cab372e78ee0179710388c56888cb9a2fef167ea58')

build() {
  cd "$pkgname-$pkgver"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr MAN_DIR=/usr/share/man/man1 install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
