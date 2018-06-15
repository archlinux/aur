pkgname=charmtimetracker
pkgver=1.12.0rc1
pkgrel=2
arch=(any)
pkgdesc=""
license=("GPL")
depends=('qt5-base' 'qt5-script' 'qtkeychain')
makedepends=('cmake')
url="https://github.com/KDAB/Charm"
source=("https://github.com/KDAB/Charm/archive/${pkgver}.tar.gz"
        buildqt511.patch::"https://github.com/KDAB/Charm/commit/51a0a34e967351411e7742cd52ce4c4e3866e9aa.patch")
sha256sums=('0d82acb0d39f0598a293cb0bd22063fd24b90d2c3152695771d2b5b6a1589dad'
            '31e7d3213fe887cbe469b684888fb85852403b3ef515338453213367282f482f')

prepare() {
  mkdir -p build

   cd Charm-${pkgver}
   patch -p1 -i ../buildqt511.patch # Fix build with Qt 5.11
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
