pkgname=evpath-git
pkgver=r2256.47465da
pkgrel=1
pkgdesc="EVpath is an event transport middleware layer"
license=('BSD')
arch=('x86_64')
url="https://github.com/GTkorvo/evpath"
depends=('gcc-libs')
makedepends=('cmake')
provides=('evpath')
conflicts=('evpath')
source=("git+https://github.com/GTkorvo/evpath.git")
sha256sums=('SKIP')

pkgver() {
  cd evpath
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd evpath
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        .
  make
}

package() {
  cd evpath
  make DESTDIR="$pkgdir" install
}

