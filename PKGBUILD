# Maintainer:F43nd1r <support@faendir.com>

pkgname=plasma-remotecontrollers-git
pkgver=r512.0510b3e
pkgrel=0
pkgdesc='Translate various input device events into keyboard and pointer events'
arch=(x86_64)
url='https://invent.kde.org/plasma-bigscreen/plasma-remotecontrollers'
license=(GPL2)
conflicts=(plasma-remotecontrollers)
depends=(plasma-workspace plasma-bigscreen)
makedepends=(extra-cmake-modules plasma-wayland-protocols libcec)
optdepends=('libcec: TV remotes support')
source=(git+https://invent.kde.org/plasma-bigscreen/plasma-remotecontrollers.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S plasma-remotecontrollers \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

