pkgname=charmtimetracker
pkgver=1.12.0rc1
pkgrel=1
arch=(any)
pkgdesc=""
license=("GPL")
depends=('qt5-base' 'qt5-script' 'qtkeychain')
makedepends=('cmake')
url="https://github.com/KDAB/Charm"
source=("https://github.com/KDAB/Charm/archive/${pkgver}.tar.gz")
sha256sums=('0d82acb0d39f0598a293cb0bd22063fd24b90d2c3152695771d2b5b6a1589dad')

prepare() {
  mkdir -p build
}

build() {
    cd build
    cmake \
      -DCharm_VERSION=${pkgver} \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_TESTING=OFF \
      ../Charm-${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
