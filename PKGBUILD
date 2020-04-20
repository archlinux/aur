# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
pkgname=xmr-stak-git
pkgver=r1457.67cf951
pkgrel=1
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake' 'opencl-headers' 'cuda')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'cuda' 'ocl-icd')
provides=('xmr-stak')
conflicts=('xmr-stak')
source=("${pkgname}::git+https://github.com/fireice-uk/xmr-stak.git#branch=master")

sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cmake .
    make
}


package() {
    install -D -m755 "$srcdir/${pkgname}/bin/xmr-stak" -t "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/${pkgname}/bin/libxmrstak_cuda_backend.so" -t "$pkgdir/usr/lib"
    install -D -m644 "$srcdir/${pkgname}/bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"
}
