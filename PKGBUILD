# Maintainer: Tong Chunli <tty2099@gmail.com>

pkgname=cyclonedds
pkgver=0.8.1
pkgrel=1
pkgdesc='Eclipse Cyclone DDS is a very performant and robust open-source DDS implementation.'
arch=('x86_64')
url='https://github.com/eclipse-cyclonedds/cyclonedds'
license=('Eclipse')
depends=('jdk')
makedepends=('cmake' 'maven')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/eclipse-cyclonedds/cyclonedds/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('ec830057682b7706492a3e9a6907c2ad6fefbd78b1794fcad21743901ff193ef')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_CXX_FLAGS="-march=native -mtune=native -pipe -O3"
    make -C build
}


package() {
    make -C build DESTDIR="$pkgdir" install
}
