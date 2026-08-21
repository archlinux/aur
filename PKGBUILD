# Maintainer: Kafin <kevinliteon01@hotmail.com>

pkgname=decrediton
pkgver=2.1.6
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Decrediton is a cross-platform GUI for decred written in node.js using Electron."
arch=('x86_64')
url="https://decred.org/"
license=('ISC')
options=('!strip')
source=("https://github.com/decred/decred-binaries/releases/download/${_pkgver}/${pkgname}-linux-amd64-${_pkgver}.tar.gz"
        "decred-dcr.svg"
        "${pkgname}.desktop")
sha256sums=('91c1f144280ad94cbee6b99bdfa2a30f980676e867f9318dab2c47942f0aad57'
            'a5d4ca6879438bbf02999dbf84f4fb3b0088fbac385f6cbc9722baf1baa7c8aa'
            '51bc5ba72c11bd89b2931d926e31524557c2ab1a8032e905fc5e33dbde132fbd')
package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/Decrediton-${_pkgver}/." "${pkgdir}/opt/${pkgname}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"

  # Desktop Entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Icon
  install -Dm644 "${srcdir}/decred-dcr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
