pkgname=kuiserver-standalone-git
pkgver=r72.30f67de
pkgrel=1
pkgdesc="Standalone version of the KIO job manager"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kuiserver-standalone"
license=(LGPL)
depends=(kinit kio kdbusaddons ki18n)
makedepends=(extra-cmake-modules git)
provides=(kuiserver-standalone)
conflicts=(kuiserver-standalone plasma-workspace)
source=('git+https://github.com/sandsmark/kuiserver-standalone.git')
md5sums=('SKIP')

pkgver() {
  cd kuiserver-standalone
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kuiserver-standalone \
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
