pkgname=enet-gtkorvo-git
pkgver=r281.7659cb4
pkgrel=1
pkgdesc="This is a downstream branch of lsalzman's ENET software"
license=('BSD')
arch=('x86_64')
url="https://github.com/GTkorvo/enet"
depends=('gcc-libs')
makedepends=('cmake')
provides=('enet')
conflicts=('enet')
source=("git+https://github.com/GTkorvo/enet.git")
sha256sums=('SKIP')

pkgver() {
  cd enet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd enet
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        .
  make
}

package() {
  cd enet
  make DESTDIR="$pkgdir" install
}

