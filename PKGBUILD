# Maintainer: Crotok <crotok [at] mailbox [dot] org>

_pkgbase=shadowcoin
pkgname=shadowcoin-bin
pkgver=1.5.0.4
pkgrel=1
pkgdesc="ShadowCoin Desktop Wallet with ShadowCoin daemon"
arch=('x86_64')
conflicts=("${_pkgbase}")
url="https://shadowproject.io"
license=('MIT')
provides=("shadowcoin=${pkgver}" "shadowcoind=${pkgver}")
install="shadowcoin.install"
source=("https://github.com/shadowproject/shadow/releases/download/v${pkgver}/umbra_${pkgver}_linux64.zip"
        "shadowcoin.desktop"
        "shadowcoin.install"
        "shadowcoin.png")

sha256sums=("7a890583155de0e689d6e450fccdf1aebf70021aa35300f42a9b733c68ab3afb"
            "d7a4712754627efdf905ff91b713688908e6bf29af11a9d8ae7c5363539347a9"
            "182cdeff1b998085ac1ee41767ae91d90fd90c6b88ad65d3edd00acd5267b209"
            "d68dec59f74ed1586c21e72463f125c05fb0db032b9e7a96ca75a043f610765a")

package() {
    # Binary file
    install -Dm755 "${srcdir}/umbra" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm755 "${srcdir}/shadowcoind" "${pkgdir}/usr/bin/shadowcoind"

    # Desktop file
    install -Dm644 "shadowcoin.desktop" "${pkgdir}/usr/share/applications/shadowcoin.desktop"

    # Icon file
    install -Dm644 "shadowcoin.png" "${pkgdir}/usr/share/pixmaps/shadowcoin.png"

    if [ ! -d "$HOME/.shadowcoin" ]; then
        echo
        echo "You can download the ShadowCoin blockchain data in order to get a fully synchronised client within ten minutes:"
        echo "url: https://github.com/ShadowProject/blockchain/releases/download/latest/blockchain.zip"
        echo "unzip path: $HOME/.shadowcoin/"
        echo
    fi
}
