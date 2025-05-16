# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Alexander Nortung <alex underscore nortung at live dot dk>

_pkgname=oxen-electron-wallet
pkgname=${_pkgname}-bin
pkgver=1.8.3
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
sha256sums=('1e80b8abe8aae32d8cd7b796efe6a01c8065a9ea67a610c598f2baab047bc62d'
            '4530452ff67e07ffa59aa19c11befd5a815be2b6037483ab659f00077be4a130')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  mv "${pkgdir}/opt/Oxen Electron Wallet" "${pkgdir}/opt/${_pkgname}"
  sed -e "s/\"\/opt\/Oxen Electron Wallet\/oxen-electron-wallet\"/${_pkgname}/g" -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
