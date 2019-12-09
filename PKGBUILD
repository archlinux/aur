# Maintainer: TheGoliath
#
pkgname=sgminer-gm
pkgver=5.5.5
pkgrel=2
pkgdesc="A multi-algo GPU miner from genesismining."
arch=('i686' 'x86_64')
url="https://github.com/nicehash/sgminer-gm"
license=('GPL3')
depends=('curl' 'ocl-icd' 'libtool' 'pkg-config' 'automake' 'autoconf')
makedepends=('opencl-headers')
optdepends=('opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
provides=('sgminer' 'sgminer-gm')
conflicts=('sgminer')
source=("${pkgname}::git+https://github.com/nicehash/sgminer-gm.git")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init
}
build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix="/usr"
    make
}
check() {
    cd "$srcdir/$pkgname"

    make check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install 
}
