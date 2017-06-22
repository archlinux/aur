pkgname=xmr-stak-nvidia-git
pkgver=r38.915ed85
pkgrel=1
pkgdesc="Monero nvidia miner"
arch=('x86_64')
url="https://github.com/nicehash/xmr-stak-nvidia"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'cuda')
source=('git+https://github.com/fireice-uk/xmr-stak-nvidia.git'
        'no-donate.patch')
sha256sums=('SKIP'
            'b936a4db91f4c35e5ff0ac51c4c1590493ddf6427a82dd0e1f57ef931950e46f')


pkgver() {
    cd "$srcdir/xmr-stak-nvidia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/xmr-stak-nvidia"
    #patch -p1 -i ../../no-donate.patch
}

build() {
    cd "$srcdir/xmr-stak-nvidia"
    CC=/usr/bin/gcc-5 CXX=/usr/bin/g++-5 cmake .
    make
}

package() {
    install -D -m755 "$srcdir/xmr-stak-nvidia/bin/xmr-stak-nvidia" -t "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/xmr-stak-nvidia/config.txt" "$pkgdir/etc/xmr-stak-nvidia.json"
}
