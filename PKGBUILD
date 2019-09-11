# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=1.1.7
pkgrel=1
pkgdesc="Privacy focused, ZeroLink compliant Bitcoin wallet"
arch=('x86_64')
options=(!strip staticlibs)
url="https://wasabiwallet.io/"
license=('MIT')
depends=('curl' 'fontconfig' 'hicolor-icon-theme')
provides=('wasabi-wallet')
conflicts=('wasabi-wallet')
source=(
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/Wasabi-${pkgver}.deb"
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/Wasabi-${pkgver}.deb.asc"
    "LICENSE.md"
)
sha256sums=('1d1eafdd68bf0e1aa75e763a56b68b77d2bf384b49b6fb3bb20f3629c7d86629'
            'SKIP'
            '986ee8b1139dbe8405801baf1081d075b53728fd5c57dd31885cf4ddbe5d8f68')
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
