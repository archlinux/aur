# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=alpscore
pkgver=1.0.0
pkgrel=1
pkgdesc="ALPS Core libraries for numerical simulations of condensed matter systems."
arch=(i686 x86_64)
url="http://alpscore.org"
license=('GPL2')
depends=('cmake' 'boost' 'hdf5')
provides=($pkgname=$pkgver)
conflicts=(alpscore-git alpscore-openmpi alpscore-openmpi-git alps)
source=("https://github.com/ALPSCore/ALPSCore/archive/v$pkgver.tar.gz")
md5sums=('ca602ac28478cc514d34fdd98513ab2e')

build() {
    cd "ALPSCore-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTesting=OFF \
        -DDocumentation=OFF \
        ..
    make
}

package() {
    cd "ALPSCore-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
