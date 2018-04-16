# Maintainer: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=5.16.4
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
url="http://map.project-osrm.org/"
depends=("expat" "boost-libs" "lua52" "intel-tbb")
makedepends=("cmake" "boost")
arch=('x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Project-OSRM/osrm-backend/archive/v$pkgver.tar.gz")
sha256sums=("c2b014cfa65deee0b8ee2c94893362951ebc42684710fa8d9f3d1ecfeb927da4")

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release
    make -j5
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd build
    make DESTDIR="${pkgdir}/" install
}
