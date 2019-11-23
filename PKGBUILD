# Maintainer: DrRac27 <drrac27 at riseup dot net>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Crotok <crotok [at] mailbox [dot] org>

pkgname=monero-bin
pkgver=0.15.0.1
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable currency - CLI release version (includes daemon, wallet and miner)"
arch=("x86_64" "i686" "armv7h" "aarch64")
conflicts=("monero")
url="https://getmonero.org/"
license=("custom:Cryptonote")
backup=("etc/monerod.conf")
provides=("monero=${pkgver}")
source_x86_64=("https://downloads.getmonero.org/cli/monero-linux-x64-v${pkgver}.tar.bz2")
source_i686=("https://downloads.getmonero.org/cli/monero-linux-x86-v${pkgver}.tar.bz2")
source_armv7h=("https://downloads.getmonero.org/cli/monero-linux-armv7-v${pkgver}.tar.bz2")
source_aarch64=("https://downloads.getmonero.org/cli/monero-linux-armv8-v${pkgver}.tar.bz2")
source=(
    "monerod.conf"
    "monerod.service"
    "monero.sysusers"
    "monero.tmpfiles"
)

sha256sums=(
    "4cad39767c033a056e4154518e4a56579fca6e57d74495e7bcc7c12bc1f0412b"
    "95da8471566386ca33c493bd3e6fce94b4c9c301009f4689d0a8aa4872afce3f"
    "57f4c4c54c7a27f2de874c00034995ce14811aca81dd3f30317ae5066c84bb0d"
    "88e80a3bbda159a22e034461e03ab8f0c1108cfb0a7475a2c94de47730493d7f"
)
sha256sums_x86_64=("8d61f992a7e2dbc3d753470b4928b5bb9134ea14cf6f2973ba11d1600c0ce9ad")
sha256sums_i686=("f157d8130978772bfe3ec4ebaca21f561dc0deffe49904af49f4a11d96c0cda6")
sha256sums_armv7h=("19c34bf8d79b6ae809efe30a4c02695cd2d8212709a5bff43a5aec49517c41ee")
sha256sums_aarch64=("67b890a10332cd91c69472e345b9ab624532540601a1d99f6fabb9c5c1b62455")

_translate_arch() {
    case "$CARCH" in
    "x86_64")
        echo "x86_64-linux-gnu"
        ;;
    "i686")
        echo "i686-linux-gnu"
        ;;
    "armv7h")
        echo "arm-linux-gnueabihf"
        ;;
    "aarch64")
        echo "aarch64-linux-gnu"
        ;;
    esac
}

package() {
    _arch="$(_translate_arch)"

    # Binary file
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monerod" "${pkgdir}/usr/bin/monerod"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-ancestry" "${pkgdir}/usr/bin/monero-blockchain-ancestry"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-depth" "${pkgdir}/usr/bin/monero-blockchain-depth"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-export" "${pkgdir}/usr/bin/monero-blockchain-export"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-import" "${pkgdir}/usr/bin/monero-blockchain-import"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-mark-spent-outputs" "${pkgdir}/usr/bin/monero-blockchain-mark-spent-outputs"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-prune" "${pkgdir}/usr/bin/monero-blockchain-prune"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-prune-known-spent-data" "${pkgdir}/usr/bin/monero-blockchain-prune-known-spent-data"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-stats" "${pkgdir}/usr/bin/monero-blockchain-stats"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-blockchain-usage" "${pkgdir}/usr/bin/monero-blockchain-usage"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-gen-ssl-cert" "${pkgdir}/usr/bin/monero-gen-ssl-cert"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-gen-trusted-multisig" "${pkgdir}/usr/bin/monero-gen-trusted-multisig"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-wallet-cli" "${pkgdir}/usr/bin/monero-wallet-cli"
    install -Dm755 "${srcdir}/monero-${_arch}-v${pkgver}/monero-wallet-rpc" "${pkgdir}/usr/bin/monero-wallet-rpc"

    # Configuration and service file
    install -Dm644 "${srcdir}/monero.sysusers" "${pkgdir}/usr/lib/sysusers.d/monero.conf"
    install -Dm644 "${srcdir}/monero.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/monero.conf"
    install -Dm644 "${srcdir}/monerod.conf" "${pkgdir}/etc/monerod.conf"
    install -Dm644 "${srcdir}/monerod.service" "${pkgdir}/usr/lib/systemd/system/monerod.service"

    # License file
    install -Dm 0644 "${srcdir}/monero-${_arch}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/monero/LICENSE"
}
