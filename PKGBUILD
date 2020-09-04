# Maintainer: Uxio Fuentefria <uxio@gnosis.io>

pkgname=gnosis-safe-multisig-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="Gnosis Safe Multisig Desktop (Beta) for Linux, a Ethereum Multisig Wallet"
arch=('x86_64')
url="https://github.com/gnosis/safe-react/releases"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("https://github.com/gnosis/safe-react/releases/download/v${pkgver}/safe-react_${pkgver}_amd64.deb")
sha256sums=('b14314f049d1332b199d4e34f805e627a6b0b834038acfc74eaf431f55013968')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz 
    find . -name '*.desktop' -exec sed -i 's/Name=Safe Multisig/Name=Gnosis Safe Multisig/g' "{}" \;
}
package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"

    cp -r "${srcdir}/opt/Safe Multisig" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/share/applications/safe-react.desktop" "${pkgdir}/usr/share/applications/gnosis-safe-multisig.desktop"
    # install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
    ln -s /opt/${pkgname}/safe-react "${pkgdir}"/usr/bin/gnosis-safe-multisig
}
