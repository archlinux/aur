# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow
pkgver=0.1.9
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications' 'kwindowsystem')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b86dac78b21b77dd251ab5f02104d2d99f3b956a6acedfa9d4879826ed0dab73')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DMINNOW_APP_VERSION="$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
