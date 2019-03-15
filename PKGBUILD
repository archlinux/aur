# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=1.1.3
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
sha256sums=('9b38903c3db24c57c6fbc392f4fae62e450ff20504eb5e4a8178d921d7cc0121'
            'SKIP'
            '986ee8b1139dbe8405801baf1081d075b53728fd5c57dd31885cf4ddbe5d8f68')
# Run gpg --keyserver pool.sks-keyservers.net --recv-keys B4B72266C47E075E
validpgpkeys=('21D7CA45565DBCCEBE45115DB4B72266C47E075E')

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
