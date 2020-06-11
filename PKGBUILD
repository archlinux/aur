# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer Vasil Yonkov <vasily@mm.st>

pkgname=xmr-stak_cpu
pkgver=1.0.5
pkgrel=1
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('cmake')
depends=('hwloc' 'openssl' 'libmicrohttpd')
source=("https://github.com/fireice-uk/xmr-stak/archive/${pkgver}-rx.tar.gz")
sha512sums=('79e2a42f31f71cdbe27b89a31d302afc1a1897acd4440482d3cb0cee2c70e90018d64e941e392ebd536e552f46f0002d9dbc4a3efde7f562880ad4236677da56')

build() {
    cd "xmr-stak-${pkgver}-rx"

    mkdir build
    cd build

    # https://github.com/fireice-uk/xmr-stak/blob/master/doc/compile/compile_Linux.md
    cmake \
        .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_LINK_STATIC=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DMICROHTTPD_ENABLE=ON \
        -DOpenSSL_ENABLE=ON \
        -DXMR-STAK_COMPILE=native \
        -DCPU_ENABLE=ON \
        -DHWLOC_ENABLE=ON \
        -DOpenCL_ENABLE=OFF \
        -DCUDA_ENABLE=OFF

    make
}

package() {
    cd "xmr-stak-${pkgver}-rx/build"
    make DESTDIR="$pkgdir/" install
}
