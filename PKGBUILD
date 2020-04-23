# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinuxo.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cervisia
pkgver=20.04.0
pkgrel=1
pkgdesc='CVS Frontend'
url='https://kde.org/applications/development/cervisia/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdesdk)
depends=(kdesu kparts hicolor-icon-theme kinit)
makedepends=(extra-cmake-modules kdoctools)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('148025f1c6368ed4f75e20ff5e3020ec86feb32dd8b4c9c94a3c0f6298a98bb6'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
