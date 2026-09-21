# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='mts-linkchats'
pkgver=0.90.0
pkgrel=1
pkgdesc='MTS Linkchats desktop application based on Electron and React'
arch=('x86_64')
license=('custom:proprietary')
url='https://mts-link.ru'
source=("https://apps.webinar.ru/weteams/linkchats-desktop.tar.gz"
  "${pkgname}.desktop")
b2sums=('dd43c5eeda33b3e57b374d840d0ad1fd4a05b254d154e9afb6fa6d387cac938a9e8c777b037c4352da57ee60de8eb43558423948ec0a5e7da2acdcf5b8e50c52'
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
