# Maintainer: Xinc

pkgname=xpathselect
_actual_ver=1.4
_extra_ver=+15.10.20150824.1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Select objects in an object tree using XPath queries"
arch=(x86_64)
url="https://launchpad.net/xpathselect"
license=(GPL)
depends=(boost)
makedepends=(gcc glibc ninja cmake)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/xpathselect_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd ${pkgname}-${_actual_ver}${_extra_ver}
# Disable tests since without gtest the compiling will fail.
  sed -i '/add_subdirectory(test)/d' CMakeLists.txt
}

build() {
  cd ${pkgname}-${_actual_ver}${_extra_ver}
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LOCALSTATEDIR=/var -DCMAKE_INSTALL_FULL_DATADIR=/usr/share -Wno-dev -G Ninja
  cmake --build build
}

package() {
  cd ${pkgname}-${_actual_ver}${_extra_ver}
  DESTDIR="$pkgdir" cmake --install build
}



