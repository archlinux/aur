# Maintainer: Daniel Rudolf <archlinux dot org at daniel-rudolf dot de>
# Contributor: Peter Cai <peter at typeblog dot net>

pkgname=udp2raw-tunnel
# NOTE: Project was renamed to 'udp2raw' in 2023 or earlier, keeping old package name for compatibility
#pkgname=udp2raw
pkgver=20230206.0
pkgrel=1
pkgdesc='A tunnel that turns UDP traffic into encrypted UDP/FakeTCP/ICMP traffic using raw sockets'
arch=('x86_64' 'i686')
url='https://github.com/wangyu-/udp2raw'
license=('MIT')
depends=('iptables')
makedepends=('gcc' 'make')
conflicts=('udp2raw-tunnel-git')
_pkgsrc="udp2raw-$pkgver"
source=("$_pkgsrc.tar.gz::https://github.com/wangyu-/udp2raw/archive/$pkgver.tar.gz"
        "udp2raw@.service")
sha256sums=('1e459020654d3c65acb252a56fe11a5e2feec5a64d6e2ffd0aacc14213bbc9c0'
            'b74afc4655cbfe8d8cb7a34aa2e307a6d7da0483722a23dcf1d2a1c2e8e52403')

build() {
    cd "$srcdir/$_pkgsrc"
    make dynamic
}

package() {
    cd "$srcdir/$_pkgsrc"
    install -vDm644 "README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -vDm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -vDm755 udp2raw_dynamic "$pkgdir/usr/bin/udp2raw"
    install -vDm644 example.conf "$pkgdir/etc/udp2raw/example.conf"
    install -vDm644 "$srcdir/udp2raw@.service" "$pkgdir/usr/lib/systemd/system/udp2raw@.service"
}
