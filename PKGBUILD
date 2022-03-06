# Maintainer: Kafin <kevinliteon01@hotmail.com>

pkgname=decrediton
pkgver=1.7.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Decrediton is a cross-platform GUI for decred written in node.js using Electron."
arch=('x86_64')
url="https://decred.org/"
license=('ISC')
source=("https://github.com/decred/decred-binaries/releases/download/${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
        "decred-dcr.svg"
        "${pkgname}.desktop")
sha256sums=('6a58126df312f760a581ed46afd7f7f3ad6491ded39ab35f3b489a6371a29c02'
            'a5d4ca6879438bbf02999dbf84f4fb3b0088fbac385f6cbc9722baf1baa7c8aa'
            '5113de3821e1445dc47dc7ea11706614432189d29722f3cd05f5535aed8b6042')
package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}-${_pkgver}/." "${pkgdir}/opt/${pkgname}"

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
