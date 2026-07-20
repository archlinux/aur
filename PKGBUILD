# SPDX-License-Identifier: 0BSD
# Maintainer: ldx123000 <ldx123000@gmail.com>

pkgname=hydrogen-music-bin
_pkgname=hydrogen-music
pkgver=0.6.1
pkgrel=1
pkgdesc='Arknights-style third-party NetEase Cloud Music player built with Electron and Vue 3'
arch=('x86_64')
url='https://github.com/ldx123000/Hydrogen-Music'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'fuse2' 'glibc' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator: system tray support')
provides=('hydrogen-music')
conflicts=('hydrogen-music')
options=('!strip')
source=(
  "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Hydrogen.Music-${pkgver}.AppImage"
  "${_pkgname}.png::https://raw.githubusercontent.com/ldx123000/Hydrogen-Music/v${pkgver}/img/icon.png"
  "${_pkgname}-LICENSE::https://raw.githubusercontent.com/ldx123000/Hydrogen-Music/v${pkgver}/LICENSE"
)
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=(
  'e46e026e50e1efc4a18b91fc832cde7dcc3f2a00df5736d8bd78067937b106e9'
  'e942d5307c7690a86826828212bbabbc13b17e13879d828b4a06b73c34cf0025'
  '0d63d1741e2c23866af592ac48a93f986a386575f90ffff2c67add4633db04e6'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
exec /opt/hydrogen-music/hydrogen-music.AppImage "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Hydrogen Music
Comment=Arknights-style third-party NetEase Cloud Music player
Exec=/usr/bin/${_pkgname} %U
Terminal=false
Type=Application
Icon=${_pkgname}
StartupWMClass=Hydrogen Music
Categories=Audio;Music;Player;
EOF
}
