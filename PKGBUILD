# Maintainer: Uxio Fuentefria <uxio@gnosis.io>

pkgname=gnosis-safe-multisig-bin
pkgver=3.8.4
pkgrel=1
pkgdesc="Gnosis Safe Multisig Desktop (Beta) for Linux, a Ethereum Multisig Wallet"
arch=('x86_64')
url="https://github.com/gnosis/safe-react/releases"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("https://github.com/gnosis/safe-react/releases/download/v${pkgver}/safe-react_${pkgver}_amd64.deb")
sha256sums=('699a8f219c7c84751e2818139916bf9792d6009b665730ed311d5f4d0b86e7d1')

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
