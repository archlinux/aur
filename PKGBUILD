# Maintainer: Uxio Fuentefria <uxio@gnosis.io>

pkgname=gnosis-safe-multisig-bin
pkgver=2.11.1
pkgrel=1
pkgdesc="Gnosis Safe Multisig Desktop (Beta) for Linux, a Ethereum Multisig Wallet"
arch=('x86_64')
url="https://github.com/gnosis/safe-react/releases"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("https://github.com/gnosis/safe-react/releases/download/v${pkgver}/safe-react_${pkgver}_amd64.deb")
sha256sums=('ac817555ebcd28590059a5bbbd351d32d91b7adf65f3457c6c50f86c6c806b1c')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz 
    find . -name '*.desktop' -exec sed -i 's/Name=Safe Multisig/Name=Gnosis Safe Multisig/g' "{}" \;
    find . -name '*.desktop' -exec sed -i 's|/opt/Safe Multisig/safe-react|/usr/bin/gnosis-safe-multisig|g' "{}" \;
    mkdir -p "${srcdir}/usr/share/icons/hicolor/256x256/apps/"
    mv "${srcdir}/usr/share/icons/hicolor/0x0/apps/safe-react.png" "${srcdir}/usr/share/icons/hicolor/256x256/apps/safe-react.png"
}
package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"

    cp -r "${srcdir}/opt/Safe Multisig" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/share/"
    # install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
    ln -s /opt/${pkgname}/safe-react "${pkgdir}"/usr/bin/gnosis-safe-multisig
}
