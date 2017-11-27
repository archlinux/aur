pkgname=xmr-stak-cpu-git
pkgver=r242.f54e02f
pkgrel=2
pkgdesc="Monero CPU miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl')
source=('git+https://github.com/fireice-uk/xmr-stak-cpu.git'
        'no-donate.patch')
sha256sums=('SKIP'
            'b279c373afbce7cc8610c44f69a5e29a4b36969d131e2fd47229211a3903912a')

pkgver() {
    cd "$srcdir/xmr-stak"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/xmr-stak"
    #patch -p1 -i ../../no-donate.patch
}

build() {
    cd "$srcdir/xmr-stak"
    cmake -DCUDA_ENABLE=off .
    make
}

package() {
    install -D -m755 "$srcdir/xmr-stak/bin/xmr-stak" -t "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/xmr-stak/bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"
}
