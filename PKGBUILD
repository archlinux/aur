# Maintainer: xuhcc <xuhcc at cryptolab dot net>

pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=2.0.3.0
_pkgver=2.0.3
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
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${_pkgver}/Wasabi-${_pkgver}.deb"
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${_pkgver}/Wasabi-${_pkgver}.deb.asc"
    "https://raw.githubusercontent.com/zkSNACKs/WalletWasabi/v${_pkgver}/LICENSE.md"
)
sha256sums=('889841b32917ac5ec7372d93a91aa6db29ac8b969db26e30340bccfb6f57b597'
            'SKIP'
            '4dde8541c5a45ae5f0c12d77415d0423e9547bf0cfe3cd47f360558efdcd9407')
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
