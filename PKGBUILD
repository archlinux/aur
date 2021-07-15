# Maintainer: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=5.25.0
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
url="http://map.project-osrm.org/"
depends=("expat" "boost-libs" "lua" "intel-tbb")
makedepends=("cmake" "boost")
arch=('x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Project-OSRM/osrm-backend/archive/v$pkgver.tar.gz")
sha256sums=("6da276d609a54600bb37007fd98d14c2a48639f51dda0d962b5801dd0118dfbb")

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DLUA_INCLUDE_DIR=/usr/include
    make VERBOSE=1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd build
    make DESTDIR="${pkgdir}/" install
}
