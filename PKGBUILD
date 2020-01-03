# Maintainer: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer Vasil Yonkov <vasily@mm.st>

pkgname=xmr-stak_cpu
pkgver=1.0.4
pkgrel=1
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('cmake')
depends=('hwloc' 'openssl' 'libmicrohttpd')
source=("https://github.com/fireice-uk/xmr-stak/archive/${pkgver}-rx.tar.gz")
sha512sums=('ce2fb84e88cd3fe2d75d73c6027eea0823d3ac77463229ae838b97ba0e91d43d5f30365363049f7de7a7c1e8e85b5511850da86ecb07ae3db86d276241a7cce3')

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
