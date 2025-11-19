# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='mts-linkchats'
pkgver=0.80.0
pkgrel=1
pkgdesc='MTS Linkchats desktop application based on Electron and React'
arch=('x86_64')
license=('custom:proprietary')
url='https://mts-link.ru'
source=("https://apps.webinar.ru/weteams/linkchats-desktop.tar.gz"
  "${pkgname}.desktop")
b2sums=('4aac95fd3c473b9a2969ca249acf082eb0c7afecd430a1247a43e7b8b84f8fb6d7cc8ca7c7d8d1ad7229e8993f30f6ab079b85a29b2cfeb80ad2848a8b754724'
  'SKIP')
provides=("${pkgname}")

package() {
  _pkgname="${pkgname/mts-/''}"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${_pkgname}-desktop-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname}"
  sed -i "s|/opt/LinkChats|/opt/${pkgname}|" "${pkgdir}/opt/${pkgname}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  ln -s "/opt/${pkgname}/resources/src/main/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
