# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kaidan
pkgver=0.6.0
pkgrel=1
pkgdesc="A user-friendly XMPP client for every device"
arch=(x86_64)
url="https://www.kaidan.im/"
license=(GPL3 MIT)
depends=(knotifications kirigami2 qt5-location qt5-svg qxmpp zxing-cpp hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz") # {,.sig}
sha256sums=('7b9008b9fcb5ff2de47ac40eaf64c97a5652e756f0eb32306f6ad1320ce52ee7')
validpgpkeys=(03C2D10DC97E5B0BEBB8F3B44663231A91A1E27B) # Linus Jahn <lnj@kaidan.im>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
