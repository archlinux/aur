# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Roman Gilg <subdiff@gmail.com>

pkgname=wrapland-git
pkgver=0.527.0.beta.0.r50
pkgrel=1
pkgdesc='Qt/C++ library that wraps and mediates the libwayland client and server API'
arch=(x86_64)
url="https://gitlab.com/kwinft/wrapland"
license=(LGPL)
depends=('kwayland5')
provides=("wrapland")
conflicts=("wrapland")
makedepends=(doxygen extra-cmake-modules git kdoctools5 wayland-protocols qt6-tools microsoft-gsl)
source=("git+https://gitlab.com/kwinft/wrapland.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"
  git describe --long --abbrev=7 --tags | sed 's/^wrapland@//;s/\([^-]*\)-g.*/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname/-git} \
    -DBUILD_QCH=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
