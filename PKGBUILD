# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Alexander Nortung <alex underscore nortung at live dot dk>

_pkgname=oxen-electron-wallet
pkgname=${_pkgname}-bin
pkgver=1.8.4
pkgrel=1
pkgdesc="Oxen electron GUI wallet"
arch=('x86_64')
url="https://github.com/oxen-io/oxen-electron-gui-wallet"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_deb="${_pkgname}-${pkgver}-linux.deb"
source=("${_deb}::https://github.com/oxen-io/oxen-electron-gui-wallet/releases/download/v${pkgver}/${_deb}"
        "LICENSE::https://raw.githubusercontent.com/oxen-io/oxen-electron-gui-wallet/v${pkgver}/LICENSE")
sha256sums=('e2163bdd83988a41c79280fb05bc67273dcf7475e5ca2cbf3e03048169b7fe2d'
            '4530452ff67e07ffa59aa19c11befd5a815be2b6037483ab659f00077be4a130')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  mv "${pkgdir}/opt/Oxen Electron Wallet" "${pkgdir}/opt/${_pkgname}"
  sed -e "s/\"\/opt\/Oxen Electron Wallet\/oxen-electron-wallet\"/${_pkgname}/g" -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
