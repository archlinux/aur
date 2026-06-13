pkgname=ioruba-desktop-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Tactile audio mixer for Arduino-based Linux control (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ioruba-desktop' 'ioruba')
conflicts=('ioruba-desktop' 'ioruba')
replaces=('ioruba')
source=(
  "Ioruba_1.1.0_amd64.AppImage::https://github.com/bernardopg/ioruba/releases/download/v${pkgver}/Ioruba_1.1.0_amd64.AppImage"
  "ioruba.png::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
  "ioruba.svg::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/app-icon.svg"
  "run-appimage-compat.sh::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/scripts/run-appimage-compat.sh"
)
sha256sums=('f9537aa19d34699a355765549c4d0ac62eec54c5f7dad86a37d7baeb46b8ec9e' '7aff3ecc3a0cbc1fed8559ae0464d2af330372514c39edfaefd31c2119a2db63' 'cf1b733eb5dbf61daab65b83e825387efdb1bec1bea5daf52864514ee8e4511a' '18703c7f9b4f15c5885fc38214060cdf8abeeea7cc84aef51d42376bc34a16f3')

package() {
  install -Dm755 "${srcdir}/Ioruba_1.1.0_amd64.AppImage" "${pkgdir}/opt/ioruba/ioruba.AppImage"
  install -Dm755 "${srcdir}/run-appimage-compat.sh" "${pkgdir}/opt/ioruba/run-appimage-compat.sh"
  install -Dm644 "${srcdir}/ioruba.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"
  install -Dm644 "${srcdir}/ioruba.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ioruba.svg"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/ioruba.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Ioruba
GenericName=Audio Mixer
GenericName[pt_BR]=Mixer de Áudio
Comment=Tactile audio mixer for Arduino-based Linux control
Comment[pt_BR]=Mixer de áudio tátil para controle via Arduino no Linux
Exec=ioruba-desktop
Icon=ioruba
Terminal=false
Categories=AudioVideo;Audio;Mixer;
Keywords=audio;mixer;volume;arduino;serial;hardware;potentiometer;
StartupNotify=true
StartupWMClass=Ioruba
DESKTOP

  printf '%s\n'     '#!/usr/bin/env sh'     'exec /opt/ioruba/run-appimage-compat.sh /opt/ioruba/ioruba.AppImage ""'     > "${pkgdir}/usr/bin/ioruba-desktop"
  chmod 755 "${pkgdir}/usr/bin/ioruba-desktop"
}
