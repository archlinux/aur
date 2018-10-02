# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=alpscore-openmpi
pkgver=2.2.0
pkgrel=1
pkgdesc="ALPS Core libraries for numerical simulations of condensed matter systems."
arch=(i686 x86_64)
url="http://alpscore.org"
license=('GPL2')
depends=('cmake' 'boost' 'hdf5' 'eigen' 'openmpi')
provides=("alpscore=$pkgver")
conflicts=(alpscore-git alpscore alpscore-openmpi-git alps)
source=("https://github.com/ALPSCore/ALPSCore/archive/v$pkgver.tar.gz")
sha256sums=('f7bc9c8f806fb0ad4d38cb6604a10d56ab159ca63aed6530c1f84ecaf40adc61')

build() {
    cd "ALPSCore-$pkgver"
    mkdir -p build
    cd build
    CC=mpicc CXX=mpicxx cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTesting=OFF -DDocumentation=OFF ..
    make
}

package() {
    cd "ALPSCore-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
