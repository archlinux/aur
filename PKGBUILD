# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=alpscore-git
pkgver=2.3.0.rc.1.r16.gc1be5698
pkgrel=1
pkgdesc="ALPS Core libraries for numerical simulations of condensed matter systems."
arch=(i686 x86_64)
url="http://alpscore.org"
license=('GPL2')
depends=('cmake' 'boost' 'hdf5')
makedepends=(git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(alpscore alpscore-openmpi alpscore-openmpi-git alps)
source=($pkgname::git+https://github.com/ALPSCore/ALPSCore.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DENABLE_MPI=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DDocumentation=OFF -DTesting=OFF ..
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
