# Maintainer: zan <zan@420blaze.it>
# Contributor Andrea Scarpino <andrea@archlinux.org>

pkgname=solid-git
_name=${pkgname%-git}
pkgver=v4.100.0.rc1.r421.g8e0957c
pkgrel=1
pkgdesc='Hardware integration and detection'
arch=(x86_64)
url='https://projects.kde.org/projects/frameworks/solid'
license=(LGPL)
depends=(qt5-declarative media-player-info udisks2 upower)
makedepends=(extra-cmake-modules git qt5-tools)
groups=(kf5)
conflicts=(solid)
provides=(solid)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
