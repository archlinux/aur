# Maintainer: Richard Dodd <richdodj@gmail.com>
# Contributor: Tong Chunli <tty2099@gmail.com>

pkgname=cyclonedds
pkgver=0.10.5
pkgrel=1
pkgdesc='Eclipse Cyclone DDS is a very performant and robust open-source implementation of Object Management Group Data-Distribution Service (OMG DDS).'
arch=('x86_64')
url='https://github.com/eclipse-cyclonedds/cyclonedds'
license=('Eclipse')
depends=('jdk-openjdk')
makedepends=('cmake' 'maven')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/eclipse-cyclonedds/cyclonedds/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('ec3ec898c52b02f939a969cd1a276e219420e5e8419b21cea276db35b4821848')

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
