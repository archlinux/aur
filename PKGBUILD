# Maintainer zan <zan@420blaze.it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjsembed-git
_name=${pkgname%-git}
pkgver=v4.100.0.rc1.r205.g08a64c6
pkgrel=1
pkgdesc='Embedded JS'
arch=(x86_64)
url='https://invent.kde.org/frameworks/kjsembed'
license=(LGPL)
depends=(ki18n qt5-svg kjs)
makedepends=(extra-cmake-modules git qt5-tools kdoctools)
groups=(kf5-aids)
conflicts=(kjsembed)
provides=(kjsembed)
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

