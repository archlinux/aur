# Maintainer: Kafin <kevinliteon01@hotmail.com>

pkgname=decrediton
pkgver=2.1.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Decrediton is a cross-platform GUI for decred written in node.js using Electron."
arch=('x86_64')
url="https://decred.org/"
license=('ISC')
source=("https://github.com/decred/decred-binaries/releases/download/${_pkgver}/${pkgname}-linux-amd64-${_pkgver}.tar.gz"
        "decred-dcr.svg"
        "${pkgname}.desktop")
sha256sums=('02410fbe7b6592b8d1a971a87928e6f8113997fcb72d82c2f3f2c5dd784b6971'
            'a5d4ca6879438bbf02999dbf84f4fb3b0088fbac385f6cbc9722baf1baa7c8aa'
            '5113de3821e1445dc47dc7ea11706614432189d29722f3cd05f5535aed8b6042')
package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/Decrediton-${_pkgver}/." "${pkgdir}/opt/${pkgname}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"

  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  install -Dm644 $srcdir/decred-dcr.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
}
