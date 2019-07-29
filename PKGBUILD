pkgname=atl-git
pkgver=r318.d2a319c
pkgrel=1
pkgdesc="Libatl provides a library for the creation and manipulation of lists of name/value pairs using an efficient binary representation"
license=('BSD')
arch=('x86_64')
url="https://github.com/GTkorvo/atl"
depends=('gcc-libs')
makedepends=('cmake')
provides=('atl')
conflicts=('atl')
source=("git+https://github.com/GTkorvo/atl.git")
sha256sums=('SKIP')

pkgver() {
  cd atl
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd atl
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        .
  make
}

package() {
  cd atl
  make DESTDIR="$pkgdir" install
}

