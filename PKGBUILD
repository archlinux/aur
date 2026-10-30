# Maintainer: dobr1n7a

pkgname='mts-linkchats-desktop'
pkgver=0.91.0
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
  '96f92b86868896f5040d39b3024dcc3090d3a83f57b03d91e8dedf7eb1efe5250cc6d5fb774f403982a1c6c75f895488f73f08358d8d9d61525d56900b10afdd'
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
