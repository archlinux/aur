# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kaidan
pkgver=0.5.0
pkgrel=1
pkgdesc="A user-friendly XMPP client for every device"
arch=(x86_64)
url="https://www.kaidan.im/"
license=(GPL3 MIT)
depends=(knotifications kirigami2 qt5-location qt5-svg qxmpp zxing-cpp hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz") # {,.sig}
sha256sums=('0f1d267d9c6001a26056789aa521bd5b0e36eea39dff95d4f33dbcd3e5257247')
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
