# Maintainer: Anderson <anderson@wirebyinfo.com>

pkgname=whatsapp-linux-covenant
_pkgname=whatsapp-desktop-linux
pkgver=1.4.8
pkgrel=1
pkgdesc="WhatsApp Desktop for Linux (Covenant Edition) built with modern Electron (binary release)"
arch=('x86_64')
url="https://github.com/araujo791/Whatsapp-Linux-Covenant"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('whatsapp-desktop-linux' 'whatsapp-linux-covenant-bin')
conflicts=('whatsapp-desktop-linux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/araujo791/Whatsapp-Linux-Covenant/releases/download/v${pkgver}/whatsapp-linux-covenant-${pkgver}-x86_64.tar.gz")
sha256sums=('0d510736bb613a09a4dff2a34497ad211dcc93c906969728ed2b82ff45272d6c')

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

  for _size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "${_srcdir}/resources/data/icons/hicolor/${_size}x${_size}/apps/io.github.covenant.WhatsAppDesktop.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/io.github.covenant.WhatsAppDesktop.png"
    install -Dm644 "${_srcdir}/resources/data/icons/hicolor/${_size}x${_size}/apps/io.github.covenant.WhatsAppDesktop-unread.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/io.github.covenant.WhatsAppDesktop-unread.png"
  done

  install -Dm644 "${_srcdir}/resources/data/icons/hicolor/scalable/apps/io.github.covenant.WhatsAppDesktop.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.covenant.WhatsAppDesktop.svg"

  install -Dm644 "${_srcdir}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
