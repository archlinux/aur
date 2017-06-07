pkgname=xmr-stak-cpu-git
pkgver=r127.d0f991c
pkgrel=1
pkgdesc="Monero CPU miner"
arch=('x86_64')
url="https://github.com/nicehash/xmr-stak-cpu"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl')
source=('git+https://github.com/fireice-uk/xmr-stak-cpu.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/xmr-stak-cpu"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/xmr-stak-cpu"
    #patch -p1 -i ../../no-donate.patch
}

build() {
    cd "$srcdir/xmr-stak-cpu"
    cmake .
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -m 0755 "$srcdir/xmr-stak-cpu/bin/xmr-stak-cpu" "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/etc/"
    install -m 0644 "$srcdir/xmr-stak-cpu/config.txt" "$pkgdir/etc/xmr-stak-cpu.json"
}
