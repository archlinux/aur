# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
pkgname=xmr-stak-rx-git
pkgver=r1463.e46dfe6
pkgrel=1
pkgdesc="Unified All-in-one Monero miner with randomx fork"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak/releases/tag/1.0.0-rx"
license=('GPL3')
makedepends=('git' 'cmake' 'opencl-headers')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'cuda' 'ocl-icd')
conflicts=('xmr-stak' 'xmr-stak-git')
provides=('xmr-stak')
source=("${pkgname}::git+https://github.com/fireice-uk/xmr-stak.git#branch=xmr-stak-rx-dev")
sha256sums=('SKIP')

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
    install -D -m755 "$srcdir/$pkgname/bin/xmr-stak-rx" -t "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/$pkgname/bin/libxmr-stak-backend.a" -t "$pkgdir/usr/lib/"
    install -D -m644 "$srcdir/$pkgname/bin/libxmr-stak-randomx.a" -t "$pkgdir/usr/lib/"
    install -D -m644 "$srcdir/$pkgname/bin/libxmrstak_cuda_backend.so" -t "$pkgdir/usr/lib"
    install -D -m644 "$srcdir/$pkgname/bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"
}
