# Maintainer: Tong Chunli <tty2099@gmail.com>

pkgname=cyclonedds
pkgver=0.7.0
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
sha256sums=('ff3a8545c78c0019014bbb906da2f44184e919a4f9985995014a0b08238d86e5')

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
