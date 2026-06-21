# Maintainer: loteran <https://github.com/loteran>
pkgname=ds5-audio-haptics-bt
pkgver=0.3.1
pkgrel=1
pkgdesc="Cross-platform configuration app for DS5Dongle — Auto Haptics Edition"
arch=('x86_64')
url="https://github.com/loteran/DS5Dongle"
license=('MIT')
depends=('hicolor-icon-theme' 'libusb')
source=(
  "${pkgname}-${pkgver}-linux-x64.tar.gz::https://github.com/loteran/DS5Dongle/releases/download/app-v${pkgver}/${pkgname}-${pkgver}-linux-x64.tar.gz"
  "70-ds5dongle.rules::https://raw.githubusercontent.com/loteran/DS5Dongle/master/config-app/70-ds5dongle.rules"
  "${pkgname}.desktop::https://raw.githubusercontent.com/loteran/DS5Dongle/master/config-app/${pkgname}.desktop"
)
sha256sums=('cf5d9cffbc9088f302ed38332afa4c84912be65b5ed4bceb78135921bdfd3a0b'
            'SKIP'
            'SKIP')

package() {
  local appdir="${srcdir}/ds5-audio-haptics-bt-linux-x64"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${appdir}/." "${pkgdir}/opt/${pkgname}/"
  chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /opt/%s/%s "$@"\n' "${pkgname}" "${pkgname}" \
    > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/70-ds5dongle.rules" \
    "${pkgdir}/etc/udev/rules.d/70-ds5dongle.rules"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
