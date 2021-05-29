# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kaidan
pkgver=0.8.0
pkgrel=1
pkgdesc='A user-friendly XMPP client for every device'
arch=(x86_64)
url='https://www.kaidan.im/'
license=(GPL3 MIT)
depends=(knotifications kirigami2 qt5-location qt5-svg qxmpp zxing-cpp hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/unstable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('a7e772dc7abab565fdf9a7bdaf575a6229bdd509de0891079a83bd32766bb1a4'
            'SKIP')
validpgpkeys=(03C2D10DC97E5B0BEBB8F3B44663231A91A1E27B) # Linus Jahn <lnj@kaidan.im>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
