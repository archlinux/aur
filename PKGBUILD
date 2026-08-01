# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow
pkgver=0.1.5.2
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications' 'kwindowsystem')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe30d54a3101a02b876eeae461cd11c638d011d2a1d18a3fd8e3c4a26455b52b')

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
