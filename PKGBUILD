#Maintainor TJM <tjm@member.fsf.org> PGP: 0xC62463BE9F6B2D7D
#Contributor Huiyiqun <huiyiqun@gmail.com>

pkgname=xmr-stak-cpu-git
pkgver=r246.5a03fc1
pkgrel=1
pkgdesc="Monero CPU miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak-cpu"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'hwloc')
source=('git+https://github.com/fireice-uk/xmr-stak-cpu.git'
        'no-donate.patch')
sha256sums=('SKIP'
			'69c46b44922b9dbdc371d8af60413753538e3d4169227cd3614e3d7d2ecd958e')

pkgver() {
    cd "$srcdir/xmr-stak-cpu"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/xmr-stak-cpu"
    patch -i ../../no-donate.patch
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
