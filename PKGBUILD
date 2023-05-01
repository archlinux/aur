# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kaidan
pkgver=0.9.0
pkgrel=1
pkgdesc='A user-friendly XMPP client for every device'
arch=(x86_64)
url='https://www.kaidan.im/'
license=(GPL3 MIT)
depends=(knotifications kirigami2 qt5-location qt5-svg qxmpp-qt5 zxing-cpp hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/unstable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/network/kaidan/-/commit/9a2f8877.patch
        https://invent.kde.org/network/kaidan/-/commit/dc41a3f3.patch
        https://invent.kde.org/network/kaidan/-/commit/c92fe312.patch)
sha256sums=('2ff1ea53b73525df79aedecefff6fa4027c645344f28e1311b77c3d91cd858f1'
            'SKIP'
            '8b354fa244dfccc0a9069a4f6b484b904c7ce4b173c56f247acc854223d8e3bd'
            '068e36e7a9434bbf79af1652f3cfa1997baf04acd4d3072ac4e95b07c1abc250'
            '8baae6ed49881954b962fba8aa4ed3a2b53ffbae4df5f10696a6635e2864b862')
validpgpkeys=(03C2D10DC97E5B0BEBB8F3B44663231A91A1E27B) # Linus Jahn <lnj@kaidan.im>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 9a2f8877.patch # ZXing-cpp 2 support
  patch -d $pkgname-$pkgver -p1 < dc41a3f3.patch
  patch -d $pkgname-$pkgver -p1 < c92fe312.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
