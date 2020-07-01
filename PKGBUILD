# Maintainer: Zanny <lordzanny@gmail.com>
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcodecs-git
_name=${pkgname%-git}
pkgver=v5.71.0.rc1.r6.g982b8e6
pkgrel=1
pkgdesc='Plugins allowing Qt applications to access further types of images'
arch=(x86_64)
url='https://projects.kde.org/projects/frameworks/kcodecs'
license=(LGPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules gperf git qt5-tools)
groups=(kf5)
conflicts=(kcodecs)
provides=(kcodecs)
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
