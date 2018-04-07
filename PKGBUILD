# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

pkgname=monero-bin
pkgver=0.12.0.0
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable currency - CLI release version (includes daemon, wallet and miner)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
conflicts=("${pkgname%-bin}")
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
source_x86_64=("https://downloads.getmonero.org/cli/monero-linux-x64-v${pkgver}.tar.bz2")
source_i686=("https://downloads.getmonero.org/cli/monero-linux-x86-v${pkgver}.tar.bz2")
source_armv7h=("https://downloads.getmonero.org/cli/monero-linux-armv7-v${pkgver}.tar.bz2")
#source_aarch64=("https://downloads.getmonero.org/cli/monero-linux-armv8-v${pkgver}.tar.bz2")
source=("monerod.conf"
        "monerod.service"
)
sha256sums=('829445fe9acc00681f94f7b9ca6ce39713e377970b0a3d6f88c37991e1aa61b2'
            '0b66160a5448dedd8e84c38ba2243187217b214b1552f504b05de120b671f121')
sha256sums_x86_64=('928ad08ff0dea2790c7777a70e610b2d33c35a5df5900fbb050cc8c659237636')
sha256sums_i686=('bebeb473a4243b4469dc83ebcaa99b9bb2c1db8a350c5e62270027dcc8c0edb2')
sha256sums_armv7h=('30d4d2c96cb56aae6b56b0f9978427346d48403b0da2acba91b8fb06e949ac35')
#sha256sums_aarch64=('f1f0850e37eb65595d8e92eb2b84f5119165f418ab54a72dfa8a149e0efa810b')


package() {
    # Binary file
    install -Dm755 "${srcdir}/monero-v${pkgver}/monerod" "${pkgdir}/usr/bin/monerod"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-export" "${pkgdir}/usr/bin/monero-blockchain-export"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-blockchain-import" "${pkgdir}/usr/bin/monero-blockchain-import"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-wallet-cli" "${pkgdir}/usr/bin/monero-wallet-cli"
    install -Dm755 "${srcdir}/monero-v${pkgver}/monero-wallet-rpc" "${pkgdir}/usr/bin/monero-wallet-rpc"

    # Configuration and service file
    install -Dm644 "${srcdir}/monerod.conf" "${pkgdir}/etc/monerod.conf"
    install -Dm644 "${srcdir}/monerod.service" "${pkgdir}/usr/lib/systemd/system/monerod.service"
}
