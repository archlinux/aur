# Maintainer: asalde_le1 <asalde.le1@gmail.com>

pkgname=mts-link
pkgver=1.2.12
pkgrel=1
pkgdesc='MTS Link desktop application based on Electron and React'
arch=(x86_64)
url='https://mts-link.ru'
license=(custom:proprietary)
changelog=${pkgname}.changelog
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
  https://apps.webinar.ru/desktop/${pkgname}-${pkgver}.tar.gz
  mts-link.desktop
)
sha256sums=('a79d1b3af4c13ef1e0a2e8b1b56ba9ec04b35057a4d1b254e6caa2a11913ad8f'
            '39ed5a6cd08c729bfd10140bb5a9c8e3e469553915c97b6de8f6078c4ea59cb0')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-desktop/"* "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  ln -s "/opt/${pkgname}/resources/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
