# Maintainer: xuhcc <xuhcc at cryptolab dot net>

pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=2.0.1.3
_pkgver=2.0.1.3
pkgrel=1
pkgdesc="Open-source, non-custodial, privacy-focused Bitcoin wallet for desktop"
arch=('x86_64')
options=(!strip staticlibs)
url="https://wasabiwallet.io/"
license=('MIT')
depends=('curl' 'fontconfig' 'hicolor-icon-theme')
provides=('wasabi-wallet')
conflicts=('wasabi-wallet')
source=(
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/Wasabi-${_pkgver}.deb"
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/Wasabi-${_pkgver}.deb.asc"
    "https://raw.githubusercontent.com/zkSNACKs/WalletWasabi/v${pkgver}/LICENSE.md"
)
sha256sums=('c067b0aeeed6c6e1331318db230c76763cc202356c9376c4ece7723ae45e5285'
            'SKIP'
            'cc774dc7850f7d097c1a5a987e2d7c89f8fa979e1f20dd8ac7905e6d1c5ec392')
# Run curl https://raw.githubusercontent.com/zkSNACKs/WalletWasabi/master/PGP.txt | gpg --import
validpgpkeys=('6FB3872B5D42292F59920797856348328949861E')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    chown -R root:root "${pkgdir}/usr/"
    chmod -R go-w "${pkgdir}/usr/"

    install -d -m755 "${pkgdir}/opt/"
    cp -r "${pkgdir}/usr/local/bin/wasabiwallet/" "${pkgdir}/opt/${_pkgname}"
    rm -r "${pkgdir}/usr/local/"

    install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/wassabee"
    ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
