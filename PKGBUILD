# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Roman Gilg <subdiff@gmail.com>

pkgname=wrapland-git
pkgver=v0.600.0.r0
pkgrel=1
pkgdesc='Qt/C++ library wrapping libwayland'
arch=(x86_64)
url="https://github.com/winft/wrapland"
license=(LGPL)
depends=('kwayland')
provides=("wrapland")
conflicts=("wrapland")
makedepends=(doxygen 'extra-cmake-modules>=5.240.0' git kdoctools wayland-protocols qt6-tools microsoft-gsl)
source=("git+https://github.com/winft/wrapland.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"
  git describe --long --abbrev=7 --tags | sed 's/^wrapland@//;s/\([^-]*\)-g.*/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname/-git} \
    -DBUILD_TESTING=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
