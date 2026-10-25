# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE"
arch=('x86_64')
url="https://forgejo.voten.me/Voten641/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications' 'kwindowsystem')
makedepends=('cmake')
# Forgejo-generated archive - unpacks to a bare "minnow/" directory, not "minnow-$pkgver/"
source=("$pkgname-$pkgver.tar.gz::https://forgejo.voten.me/Voten641/minnow/archive/v$pkgver.tar.gz")
sha256sums=('721209b8a61be8e991124f9ee179161bacf748ab796bf83d460ae9e780bcef97')

build() {
  cmake -B build -S minnow \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DMINNOW_APP_VERSION="$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
