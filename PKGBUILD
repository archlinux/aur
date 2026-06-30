# Maintainer: dobr1n7a

pkgname='mts-linkchats-desktop'
pkgver=0.87.0
pkgrel=1
pkgdesc='MTS Linkchats desktop'
arch=('x86_64')
url='https://mts-link.ru'
license=('unknown')
source=(
  "https://apps.webinar.ru/weteams/linkchats-desktop.tar.gz"
  "mts-linkchats-desktop.desktop"
)
b2sums=(
  '80347af8b887ef0e6e1554c8e0d1faee3bae0189e6689a278e38a990ca77648810669f925df851c7d5d4c37895645281943ca784506428a30909bc067ac45f91'
  'SKIP'
)

package() {
  # Install application files to /opt
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/linkchats-desktop-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname}"

  # Update hardcoded paths in the launcher script
  sed -i "s|/opt/LinkChats|/opt/${pkgname}|" "${pkgdir}/opt/${pkgname}/mtslink"

  # Create symlink in /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/mtslink" "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop entry file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Create symlink for application icon
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  ln -s "/opt/${pkgname}/resources/src/main/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
