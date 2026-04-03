# Maintainer: dobr1n7a

pkgname='mts-linkchats-desktop'
pkgver=0.84.0
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
  '8bfe9e723d399ebefa3e641e62bff31f5879d0feca910d7946764834cc30e3cf9406fcbada3e57eb2eb45d730d8e262ddd024acf7a69f6473de36329d6c0b1bc'
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
