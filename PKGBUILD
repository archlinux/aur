# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow
pkgver=0.1.5.1
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications' 'kwindowsystem')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('510e7a7f9f43e544a2249450dbf20aba9998fcce16d3c17a7aff54e94a0f3a66')

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
