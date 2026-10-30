# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='mts-linkchats'
pkgver=0.91.0
pkgrel=1
pkgdesc='MTS Linkchats desktop application based on Electron and React'
arch=('x86_64')
license=('custom:proprietary')
url='https://mts-link.ru'
source=("https://apps.webinar.ru/weteams/linkchats-desktop.tar.gz"
  "${pkgname}.desktop")
b2sums=('96f92b86868896f5040d39b3024dcc3090d3a83f57b03d91e8dedf7eb1efe5250cc6d5fb774f403982a1c6c75f895488f73f08358d8d9d61525d56900b10afdd'
  'SKIP')
provides=("${pkgname}")

package() {
  _pkgname="${pkgname/mts-/''}"
  _binary_name="mtslink"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${_pkgname}-desktop-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname}"
  sed -i "s|/opt/LinkChats|/opt/${pkgname}|" "${pkgdir}/opt/${pkgname}/${_binary_name}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_binary_name}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  ln -s "/opt/${pkgname}/resources/src/main/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
