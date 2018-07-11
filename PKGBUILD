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
            '21afb4ceab3c512f6a5862e91e099a478c3eefd52ba2849c1751343b78e283a357d1bc3f22428cf28a9a91e3995ff705d3263c225cc9bacb329fa660acb0b9a3')

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
