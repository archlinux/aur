# Maintainer: asalde_le1 <asalde.le1@gmail.com>

pkgname=mts-link-meetings
pkgver=1.2.13
pkgrel=1
pkgdesc='MTS Link Meetings desktop application based on Electron and React'
arch=(x86_64)
url='https://mts-link.ru'
license=(custom:proprietary)
changelog=${pkgname}.changelog
replaces=('mts-link')
depends=(
  alsa-lib
  at-spi2-core
  gtk3
  libnotify
  libsecret
  libuuid.so=1-64
  libxss
  libxtst
  nss
  xdg-utils
)
optdepends=(
  'libappindicator-gtk3: Systray indicator support'
)
source=(
  https://apps.webinar.ru/desktop/mts-link-${pkgver}.tar.gz
  mts-link-meetings.desktop
)
sha256sums=('111161ab96822923e4352cd2523f57cc2bf7f5b76c9d5e654cc12b11cf567295'
            'e1de286d013a8c0bba6fe44a8f4138a68d600835b5320b3ab2bbb29b0c5cbb2e')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-desktop/"* "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  ln -s "/opt/${pkgname}/resources/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
