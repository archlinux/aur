# Maintainer: Kafin <kevinliteon01@hotmail.com>

pkgname=decrediton
pkgver=1.1.3
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Decrediton is a cross-platform GUI for decred written in node.js using Electron."
arch=('x86_64')
url="https://decred.org/"
license=('ISC')
source=("https://github.com/decred/decred-binaries/releases/download/${_pkgver}/${pkgname}-${_pkgver}.tar.gz"
        "decred-dcr.svg"
        "${pkgname}.desktop")
sha256sums=('d5b4e8ab3844866bd16959666eae3dfdc46e9452f3aca03c20ae2e2f259a38de'
            'a5d4ca6879438bbf02999dbf84f4fb3b0088fbac385f6cbc9722baf1baa7c8aa'
            'b2693919cdd9557676f1c3f6e5ed167080d8ce52cab7fca385796aa9bd4baab5')

package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/opt/${pkgname}"

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
