# Maintainer: Dictator Mei <dctxmei@gmail.com>
pkgname=net-speeder-git
pkgver=20160303
pkgrel=1
pkgdesc="A program to speed up single thread download upon long delay and unstable network"
arch=('x86_64')
url="https://github.com/snooda/net-speeder"
license=('GPL')
depends=('libnet' 'libpcap')
provides=('net-speeder')
conflicts=('net-speeder')
source=("git+https://github.com/snooda/net-speeder.git"
        "net-speeder.service")
sha512sums=('SKIP'
            '2292ac1212412f82a3d29243109a8868ff6b86dad286a1cb92e9abda59f4bdfaa7d5faebda28a8bb1a551b9536140ab4fd6668da8f2b5cbfe1c2bda44b5808ff')

prepare() {
    git -C net-speeder log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd net-speeder
    bash build.sh
    #bash build.sh -DCOOKED
}

package() {
    install -Dm755 "$srcdir"/net-speeder/net_speeder "$pkgdir"/usr/bin/net-speeder
    install -Dm644 "$srcdir"/net-speeder.service "$pkgdir"/usr/lib/systemd/system/net-speeder.service
}
