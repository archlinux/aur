
pkgname=kmoretools-git
_name=${pkgname%-git}
pkgver=v5.102.0.r34.g31399a2e
pkgrel=1
pkgdesc='Support for downloading application assets from the network'
arch=(x86_64)
url='https://invent.kde.org/libraries/kmoretools'
license=(LGPL)
depends=(qt6-base)
makedepends=(git ninja extra-cmake-modules-git)
groups=(kf5)
conflicts=(kmoretools)
provides=(kmoretools)
source=("git+https://invent.kde.org/libraries/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -G Ninja -DBUILD_QCH=ON -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "$_name"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
