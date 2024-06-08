# Maintainer: xuhcc <xuhcc at cryptolab dot net>

pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=2.0.8.1
_pkgtag=2.0.8.1
_pkgver=$_pkgtag
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
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${_pkgtag}/Wasabi-${_pkgver}.deb"
    "https://github.com/zkSNACKs/WalletWasabi/releases/download/v${_pkgtag}/Wasabi-${_pkgver}.deb.asc"
    "https://raw.githubusercontent.com/zkSNACKs/WalletWasabi/v${_pkgtag}/LICENSE.md"
)
sha256sums=('4aab0e55b1f3cf89822887b0e167eda0a779542403ff040325966c6ee2ef6206'
            'SKIP'
            '4ae416e0372ca4b8f0dd46353edc9d46f4125aa4ac00b29f913642a0c8a031a4')
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
