# Maintainer: Uxio Fuentefria <uxio@gnosis.io>

pkgname=gnosis-safe-multisig-bin
pkgver=2.17.2
pkgrel=1
pkgdesc="Gnosis Safe Multisig Desktop (Beta) for Linux, a Ethereum Multisig Wallet"
arch=('x86_64')
url="https://github.com/gnosis/safe-react/releases"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("https://github.com/gnosis/safe-react/releases/download/v${pkgver}/safe-react_${pkgver}_amd64.deb")
sha256sums=('0b6129034c4680aa648c543b4da10e0ead8064fb0d33dfb9fbf0d72243cddb79')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz 
    find . -name '*.desktop' -exec sed -i 's/Name=Safe Multisig/Name=Gnosis Safe Multisig/g' "{}" \;
    find . -name '*.desktop' -exec sed -i 's|/opt/Safe Multisig/safe-react|/usr/bin/gnosis-safe-multisig|g' "{}" \;
}
package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"

    cp -r "${srcdir}/opt/Safe Multisig" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/share/"
    # install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
    ln -s /opt/${pkgname}/safe-react "${pkgdir}"/usr/bin/gnosis-safe-multisig
}
