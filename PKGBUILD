# Maintainer: xuhcc <xuhcc at cryptolab dot net>

pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=2.7.1.0
_pkgtag=2.7.1
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
sha256sums=('d8635e3665e9a3d9d4f1a84e03d0fd17ffd02ade05ff406e92af81511cf5aefa'
            'SKIP'
            '8b39b9b4a55bce0c65354a671f19d599138f2c4361135e832487260f98c73b25')
# Run curl https://raw.githubusercontent.com/zkSNACKs/WalletWasabi/master/PGP.txt | gpg --import
validpgpkeys=('6FB3872B5D42292F59920797856348328949861E')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    chown -R root:root "${pkgdir}/usr/"
    chmod -R go-w "${pkgdir}/usr/"

    install -d -m755 "${pkgdir}/opt/"
    chmod -R u+x "${pkgdir}/usr/local/bin/wasabiwallet/"
    cp -r "${pkgdir}/usr/local/bin/wasabiwallet/" "${pkgdir}/opt/${_pkgname}"
    rm -r "${pkgdir}/usr/local/"

    install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/wassabee"
    ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
