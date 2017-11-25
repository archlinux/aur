# Maintainer: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=5.13.0
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
url="http://map.project-osrm.org/"
depends=("expat" "boost-libs" "lua52" "intel-tbb")
makedepends=("cmake" "boost")
arch=('x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Project-OSRM/osrm-backend/archive/v$pkgver.tar.gz")
sha256sums=("a5b9fe1a7d96292a573a023f8ef7d2ce862855f2f0d6d2c189c542a0ffa8b49a")

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
