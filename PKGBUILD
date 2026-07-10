# Maintainer: dobr1n7a

pkgname='mts-linkchats-desktop'
pkgver=0.87.1
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
  '49ec59f081ef2b1a4054326efbc0e5986ae313d614826e21d97e051cd1c97e9142a7d3761bafc119d6757a879f238c9daea8aef989d8d4cdb591c43256632a0b'
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
