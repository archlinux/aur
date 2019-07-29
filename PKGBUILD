pkgname=dill-git
pkgver=r536.7ad8a9a
pkgrel=1
pkgdesc="DILL provides instruction-level code generation, register allocation and simple optimizations"
license=('BSD')
arch=('x86_64')
url="https://github.com/GTkorvo/dill"
depends=('gcc-libs')
makedepends=('cmake')
provides=('dill')
conflicts=('dill')
source=("git+https://github.com/GTkorvo/dill.git")
sha256sums=('SKIP')

pkgver() {
  cd dill
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dill
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        .
  make
}

package() {
  cd dill
  make DESTDIR="$pkgdir" install
}

