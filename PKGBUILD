# Maintainer: Anderson <anderson@wirebyinfo.com>

pkgname=whatsapp-linux-covenant
_pkgname=whatsapp-desktop-linux
pkgver=1.3.0
pkgrel=3
pkgdesc="WhatsApp Desktop for Linux (Covenant Edition) built with modern Electron (binary release)"
arch=('x86_64')
url="https://github.com/araujo791/Whatsapp-Linux-Covenant"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('whatsapp-desktop-linux' 'whatsapp-linux-covenant-bin')
conflicts=('whatsapp-desktop-linux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/araujo791/Whatsapp-Linux-Covenant/releases/download/v${pkgver}/whatsapp-linux-covenant-${pkgver}-x86_64.tar.gz")
sha256sums=('c137bb2a24a7a2d15bc9cd200766b8b0aabf2629d44c3f7f0eab5bf612bc9d81')

package() {
  local _srcdir="${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp -a "${_srcdir}"/* "${pkgdir}/opt/${pkgname}/"

  ln -sf "/opt/${pkgname}/whatsapp-linux-covenant" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/opt/${pkgname}/whatsapp-linux-covenant" "${pkgdir}/usr/bin/whatsapp-desktop-linux"

  install -Dm644 "${_srcdir}/resources/data/io.github.covenant.WhatsAppDesktop.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${_srcdir}/resources/data/io.github.covenant.WhatsAppDesktop.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"

  install -Dm644 "${_srcdir}/resources/data/icons/hicolor/512x512/apps/io.github.covenant.WhatsAppDesktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.covenant.WhatsAppDesktop.png"

  install -Dm644 "${_srcdir}/resources/data/icons/hicolor/scalable/apps/io.github.covenant.WhatsAppDesktop.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.covenant.WhatsAppDesktop.svg"

  install -Dm644 "${_srcdir}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
