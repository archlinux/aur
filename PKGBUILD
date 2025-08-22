# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-remotecontrollers-git
pkgver=r24.ee3caea
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
  cd "$srcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S plasma-remotecontrollers \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$srcdir" cmake --install build
}

