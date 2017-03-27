# Maintainer: Crotok <crotok [at] mailbox [dot] org>

_pkgbase=monero
pkgname=monero-bin
pkgver=0.10.3.1
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable currency - release version (includes deaemon, wallet and miner)"
arch=("x86_64" "i686")
conflicts=("${_pkgbase}")
url="https://getmonero.org/"
license=("BSD")
backup=("etc/monerod.conf")
provides=("monerod=${pkgver}"
          "monero-blockchain-export=${pkgver}"
          "monero-blockchain-import=${pkgver}"
          "monero-utils-deserialize=${pkgver}"
          "monero-wallet-cli=${pkgver}"
          "monero-wallet-rpc=${pkgver}"
)

source=("https://downloads.getmonero.org/cli/monero-linux-x64-v${pkgver}.tar.bz2"
        "monerod.conf"
        "monerod.service"
)

sha256sums=("8db80f8cc4f80d4106db807432828df730a59eac78972ea81652aa6b9bac04ad"
            "829445fe9acc00681f94f7b9ca6ce39713e377970b0a3d6f88c37991e1aa61b2"
            "0b66160a5448dedd8e84c38ba2243187217b214b1552f504b05de120b671f121"
)

if [ "$CARCH" = 'i686' ]; then
    source[0]="https://downloads.getmonero.org/cli/monero-linux-x86-v${pkgver}.tar.bz2"
    sha256sums[0]="abc99f3928f4083bd1a380a869253e07bee9950e0aeb6388e9493bc0f0ec3f53"
fi

package() {
    # Binary file
    install -Dm755 "${srcdir}/monero-v${pkgver}/monerod" "${pkgdir}/usr/bin/monerod"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-export" "${pkgdir}/usr/bin/monero-blockchain-export"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-import" "${pkgdir}/usr/bin/monero-blockchain-import"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-utils-deserialize" "${pkgdir}/usr/bin/monero-utils-deserialize"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-wallet-cli" "${pkgdir}/usr/bin/monero-wallet-cli"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-wallet-rpc" "${pkgdir}/usr/bin/monero-wallet-rpc"

    # Configuration and service file
    install -Dm644 "${srcdir}/monerod.conf" "${pkgdir}/etc/monerod.conf"
    install -Dm644 "${srcdir}/monerod.service" "${pkgdir}/usr/lib/systemd/system/monerod.service"
}
