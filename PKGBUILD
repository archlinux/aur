pkgname=charmtimetracker
pkgver=1.12.0
pkgrel=1
arch=(any)
pkgdesc=""
license=("GPL")
depends=('qt5-base' 'qt5-script' 'qtkeychain')
makedepends=('cmake' 'make')
url="https://github.com/KDAB/Charm"
source=("https://github.com/KDAB/Charm/archive/${pkgver}.tar.gz")
sha256sums=('7c6879bc474d33d66675db9a23e9661ba0f329cd3bf9a23ce45d565383730deb')

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
