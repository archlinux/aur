# Maintainer: d10n <david@bitinvert.com>
pkgname=netbird-mullvad-bypass
pkgver=1.2.0
pkgrel=1
pkgdesc="Allow Mullvad and Netbird to coexist"
arch=(any)
url='https://github.com/d10n/netbird-mullvad-bypass'
license=(MIT)
depends=(nftables iproute2)
optdepends=(netbird mullvad-vpn)
source=(
"$pkgname-$pkgver.tar.gz::https://github.com/d10n/netbird-mullvad-bypass/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('d49737ff94b3cae25aecb52c3369f8be0d475e4b700caf0c39a091c7e986610b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 netbird-mullvad-bypass.service \
        "$pkgdir/usr/lib/systemd/system/netbird-mullvad-bypass.service"
    install -Dm644 netbird-mullvad-bypass-watch.service \
        "$pkgdir/usr/lib/systemd/system/netbird-mullvad-bypass-watch.service"
    install -Dm644 netbird-mullvad-bypass.nft \
        "$pkgdir/usr/lib/$pkgname/netbird-mullvad-bypass.nft"
    install -Dm755 populate-routed-nets.sh \
        "$pkgdir/usr/lib/$pkgname/populate-routed-nets.sh"
    install -Dm755 watch-routed-nets.sh \
        "$pkgdir/usr/lib/$pkgname/watch-routed-nets.sh"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}

