# Maintainer: Uxio Fuentefria <uxio@gnosis.io>

pkgname=gnosis-safe-multisig-bin
pkgver=3.17.2
pkgrel=1
pkgdesc="Gnosis Safe Multisig Desktop (Beta) for Linux, a Ethereum Multisig Wallet"
arch=('x86_64')
url="https://github.com/gnosis/safe-react/releases"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("https://github.com/gnosis/safe-react/releases/download/v${pkgver}-desktop/safe-react_${pkgver}_amd64.deb")
sha256sums=('65d7bb1fe2e0ce9b09ded2a7bfb67f16e4b780b99f8f9a337440639cd8069d5a')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz 
    find . -name '*.desktop' -exec sed -i 's/Name=Safe/Name=Gnosis Safe Multisig/g' "{}" \;
    find . -name '*.desktop' -exec sed -i 's|/opt/Safe/safe-react|/usr/bin/gnosis-safe-multisig|g' "{}" \;
}
package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"

    cp -r "${srcdir}/opt/Safe" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/share/"
    # install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
    ln -s /opt/${pkgname}/safe-react "${pkgdir}"/usr/bin/gnosis-safe-multisig
}
