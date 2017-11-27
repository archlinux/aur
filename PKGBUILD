pkgname=xmr-stak-cpu-nicehash-git
pkgver=r246.5a03fc1
pkgrel=1
pkgdesc="Monero CPU miner"
arch=('x86_64')
url="https://github.com/nicehash/xmr-stak-cpu"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'hwloc')
source=('git+https://github.com/fireice-uk/xmr-stak-cpu.git'
        'no-donate.patch')
sha256sums=('SKIP'
            'c973333e53efa4a94042f5b7c5d5d1b6995bb2cf261ac0ac7f735d93d795a6a6')

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
    install -D -m755 "$srcdir/xmr-stak-cpu/bin/xmr-stak-cpu" -t "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/xmr-stak-cpu/config.txt" "$pkgdir/etc/xmr-stak-cpu.json"
}
