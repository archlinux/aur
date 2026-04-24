# Maintainer: dobr1n7a

pkgname='mts-linkchats-desktop'
pkgver=0.85.0
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
  'eb408141f477f6e51e3981573e43e629912a438b2b5f1d46d9df5c9ce92a1ef502523b8b5fb585cee74058c44dc89589a593bf0cc97057d602c4079f83baa3e9'
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
