pkgname=sandsmark-integration-git
pkgver=r266.6a4be93
pkgrel=1
pkgdesc="Qt platform integration (QPA) for myself, just how I like it"
arch=(i686 x86_64)
url="https://github.com/sandsmark/sandsmark-integration"
license=(LGPL)
depends=(kinit kio kdbusaddons ki18n)
makedepends=(extra-cmake-modules git)
provides=(sandsmark-integration)
conflicts=(sandsmark-integration)
source=('git+https://github.com/sandsmark/sandsmark-integration.git')
md5sums=('SKIP')
OPTIONS=('debug' '!strip')

pkgver() {
  cd sandsmark-integration
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../sandsmark-integration \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
