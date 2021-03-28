pkgname=riseup-vpn
pkgrel=1
pkgver=0.21.2
_commit=7ed49b92ff19205af276dee371174579c8b4c811
pkgdesc="RiseupVPN is a branded build of Bitmask VPN. Bitmask VPN is a minimal rewrite of the Bitmask VPN Client, written in golang, that for now lacks client authentication, and is preconfigured to use a single provider."
url="https://0xacab.org/leap/bitmask-vpn"
arch=('any')
license=('GPL3')
depends=(
    'gtk3'
    'libappindicator-gtk3'
    'python'
    'openvpn'
)
makedepends=(
    'go'
    'git'
)
source=(
    "git+https://0xacab.org/leap/bitmask-vpn.git#commit=${_commit}"
    "riseup-vpn_launcher.desktop"
    "riseup-vpn.png"
)
sha1sums=(
    'SKIP'
    '17e503a9c0a119c4eb78f0eee243ffc7f85095b5'
    '7cb4d92288febba7de7da27c5ee8f7d867a0b221'
)
build() {
    cd "bitmask-vpn"
    PROVIDER=riseup make build
}

package() {
    cd "bitmask-vpn"
    install -Dm755 helpers/bitmask-root "${pkgdir}/usr/bin/bitmask-root"
    install -Dm644 helpers/se.leap.bitmask.policy "${pkgdir}/usr/share/polkit-1/actions/se.leap.bitmask.policy"
#   install -Dm755 build/qt/release/riseup-vpn "${pkgdir}/usr/bin/riseup-vpn"
    install -Dm755 build/bin/linux/bitmask-vpn "${pkgdir}/usr/bin/riseup-vpn"
    cd ..
    install -Dm644 riseup-vpn_launcher.desktop "${pkgdir}/usr/share/applications/riseup-vpn_launcher.desktop"
    install -Dm644 riseup-vpn.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/riseup-vpn.png"
}
