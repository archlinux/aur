# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kaidan
pkgver=0.4.0
pkgrel=1
pkgdesc="A user-friendly XMPP client for every device"
arch=(x86_64)
url="https://www.kaidan.im/"
license=(GPL3 MIT)
depends=(knotifications kirigami2 qt5-svg qxmpp desktop-file-utils hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('c2ec16d2acfb4c62d3eef652e492a7267124148d458321436eaf1916e8ed4d9e'
            'SKIP')
validpgpkeys=(03C2D10DC97E5B0BEBB8F3B44663231A91A1E27B) # Linus Jahn <lnj@kaidan.im>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
