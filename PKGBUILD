# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='mts-linkchats'
pkgver=0.87.2
pkgrel=1
pkgdesc='MTS Linkchats desktop application based on Electron and React'
arch=('x86_64')
license=('custom:proprietary')
url='https://mts-link.ru'
source=("https://apps.webinar.ru/weteams/linkchats-desktop.tar.gz"
  "${pkgname}.desktop")
b2sums=('609382cee21bc24938110d3d71744030795918f782cf26e6b3b01f63bd552dfb99eb0b079edc1bc28421be4526579eaad4d17212d0e8b0e88889d380e2eb6773'
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
