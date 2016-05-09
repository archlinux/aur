# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wangle-git
pkgver=0.13.0.r152.g0eae7be
pkgrel=1
pkgdesc='A full featured, high performance C++ futures implementation'
arch=(i686 x86_64)
url='https://github.com/facebook/wangle'
license=(BSD)
conflicts=(wangle)
provides=(wangle)
replaces=(wangle)
depends=(folly boost boost-libs openssl google-glog gflags)
makedepends=(git cmake)
source=(git+https://github.com/facebook/wangle.git)
md5sums=(SKIP)

pkgver() {
  cd wangle
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wangle/wangle
  sed -i 's|std=c++0x|std=c++11|' CMakeLists.txt
}

build() {
  cd wangle/wangle
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=OFF
  make
}

package() {
  cd wangle/wangle
  make DESTDIR="$pkgdir" install
}

