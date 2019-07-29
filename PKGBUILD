pkgname=ffs-git
pkgver=r1180.7774ca6
pkgrel=1
pkgdesc="FFS is a middleware library for data communication"
license=('BSD')
arch=('x86_64')
url="https://github.com/GTkorvo/ffs"
depends=('atl' 'dill')
makedepends=('cmake')
provides=('ffs')
conflicts=('ffs')
source=("git+https://github.com/GTkorvo/ffs.git")
sha256sums=('SKIP')

pkgver() {
  cd ffs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ffs
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        .
  make
}

package() {
  cd ffs
  make DESTDIR="$pkgdir" install
}

