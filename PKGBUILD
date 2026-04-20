pkgname=ioruba-desktop-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Tactile audio mixer for Arduino-based Linux control (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ioruba-desktop')
conflicts=('ioruba-desktop')
source=(
  "Ioruba_0.5.0_amd64.AppImage::https://github.com/bernardopg/ioruba/releases/download/v${pkgver}/Ioruba_0.5.0_amd64.AppImage"
  "ioruba.png::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
)
sha256sums=('8719f61be132b3bed77a7147470552821161cdb2dbb7f9581cb4f13be9644087' '7aff3ecc3a0cbc1fed8559ae0464d2af330372514c39edfaefd31c2119a2db63')

package() {
  install -Dm755 "${srcdir}/Ioruba_0.5.0_amd64.AppImage" "${pkgdir}/opt/ioruba/ioruba.AppImage"
  install -Dm644 "${srcdir}/ioruba.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"
  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/ioruba.desktop"

  printf '%s\n'     '[Desktop Entry]'     'Type=Application'     'Name=Ioruba'     'Comment=Tactile audio mixer for Arduino-based Linux control'     'Exec=ioruba-desktop'     'Icon=ioruba'     'Categories=AudioVideo;Audio;'     'Terminal=false'     > "${pkgdir}/usr/share/applications/ioruba.desktop"

  install -Dm755 /dev/null "${pkgdir}/usr/bin/ioruba-desktop"
  printf '%s\n' '#!/usr/bin/env sh' 'exec /opt/ioruba/ioruba.AppImage ""' > "${pkgdir}/usr/bin/ioruba-desktop"
}
