# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-remotecontrollers-git
pkgver=5.26.90.r308.g3bbb4f9
pkgrel=1
pkgdesc='Translate various input device events into keyboard and pointer events'
arch=(x86_64)
url='https://invent.kde.org/plasma-bigscreen/plasma-remotecontrollers'
license=(GPL2)
conflicts=(plasma-remotecontrollers)
depends=(plasma-workspace-git plasma-bigscreen-git)
makedepends=(extra-cmake-modules-git plasma-wayland-protocols-git libcec-git)
optdepends=('libcec: support for TV remotes')
source=(git+https://invent.kde.org/plasma-bigscreen/plasma-remotecontrollers.git)
sha256sums=('SKIP')

pkgver() {
  cd "plasma-remotecontrollers"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S plasma-remotecontrollers \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$srcdir" cmake --install build
}

