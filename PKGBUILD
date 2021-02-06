# Maintainer: EndlessEden <eden@rose.place>
#
pkgname=sgminer-arm
pkgver=5.5.6
pkgrel=2
pkgdesc="A multi-algo OpenCL miner based on sgminer-gm from genesismining.(Mali Optimised)"
arch=('aarch64')
url="https://github.com/nicehash/sgminer-gm"
license=('GPL3')
depends=('curl' 'ocl-icd' 'libtool' 'pkg-config' 'automake' 'autoconf' 'ncurses')
makedepends=('opencl-headers' 'gmp' 'jansson' 'armcl-opencl-mali')
optdepends=('dkms-mali: OpenCL implementation for Mali'
	    'opencl-mesa: OpenCL implementation for AMD/NVIDIA/MALI[incomplete]')
provides=('sgminer' 'sgminer-gm')
conflicts=('sgminer')
source=("${pkgname}::git+https://github.com/wll1rah/sgminer-arm.git")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init
}
build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix="/usr" --disable-adl --disable-adl-checks
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
