# Maintainer: windx-foobar <bezalkogolnycoder at gmail dot com>

pkgname='mts-linkchats'
pkgver=0.80.1
pkgrel=1
pkgdesc='MTS Linkchats desktop application based on Electron and React'
arch=('x86_64')
license=('custom:proprietary')
url='https://mts-link.ru'
source=("https://apps.webinar.ru/weteams/linkchats-desktop.tar.gz"
  "${pkgname}.desktop")
b2sums=('c5b7688388830e72e984a5f3c6ba378ec88721e97f7bc6e51d58fe3c04c098ea7e9af567d499427f740837cdb1ee5b0318dca4c9a0201bfb6d13d80fdf6729c5'
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
