# Maintainer: TheGoliath
#
pkgname=sgminer
pkgver=5.6.1
pkgrel=1
pkgdesc="A multi-threaded multi-pool GPU miner for scrypt-based coins."
arch=('i686' 'x86_64')
url="https://github.com/nicehash/sgminer/"
license=('GPL3')
depends=('curl' 'ocl-icd' 'libtool' 'pkg-config' 'automake' 'autoconf')
makedepends=('opencl-headers')
optdepends=('ncurses5-compat: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
provides=('sgminer')
conflicts=('sgminer-gm')
source=("${pkgname}::git+https://github.com/nicehash/sgminer.git")
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
