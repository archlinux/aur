pkgname=ioruba-desktop-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Tactile audio mixer for Arduino-based Linux control (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ioruba-desktop' 'ioruba')
conflicts=('ioruba-desktop' 'ioruba' 'ioruba-desktop-bin')
replaces=('ioruba')
source=(
  "Ioruba_0.6.1_amd64.AppImage::https://github.com/bernardopg/ioruba/releases/download/v${pkgver}/Ioruba_0.6.1_amd64.AppImage"
  "ioruba.png::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
  "run-appimage-compat.sh::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/scripts/run-appimage-compat.sh"
)
sha256sums=('18cae2d533749d5533300fb8f4e09c02c1d886be3716eeff65307d6ab0ccd183'
            '7aff3ecc3a0cbc1fed8559ae0464d2af330372514c39edfaefd31c2119a2db63'
            '18703c7f9b4f15c5885fc38214060cdf8abeeea7cc84aef51d42376bc34a16f3')

package() {
  install -Dm755 "${srcdir}/Ioruba_0.6.1_amd64.AppImage" "${pkgdir}/opt/ioruba/ioruba.AppImage"
  install -Dm755 "${srcdir}/run-appimage-compat.sh" "${pkgdir}/opt/ioruba/run-appimage-compat.sh"
  install -Dm644 "${srcdir}/ioruba.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"

  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/ioruba.desktop"
  printf '%s\n' \
    '[Desktop Entry]' \
    'Type=Application' \
    'Name=Ioruba' \
    'Comment=Tactile audio mixer for Arduino-based Linux control' \
    'Exec=ioruba-desktop' \
    'Icon=ioruba' \
    'Categories=AudioVideo;Audio;' \
    'Terminal=false' \
    > "${pkgdir}/usr/share/applications/ioruba.desktop"

  printf '%s\n' \
    '#!/usr/bin/env sh' \
    'exec /opt/ioruba/run-appimage-compat.sh /opt/ioruba/ioruba.AppImage "$@"' \
    > "${pkgdir}/usr/bin/ioruba-desktop"
  chmod 755 "${pkgdir}/usr/bin/ioruba-desktop"
}
