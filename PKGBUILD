# Maintainer: swindlesmccoop@waifu.club
pkgname=wheelwizard-bin
_name=WheelWizard
_app_id=io.github.TeamWheelWizard.WheelWizard
pkgver=2.5.7
_pkgver="v$pkgver"
pkgrel=1
pkgdesc="Mario Kart Mod Manager & Retro Rewind Auto Updater (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Team${_name}/${_name}"
license=('GPL-3.0-only')
options=(!strip)
depends=('glibc' 'fontconfig' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'libx11' 'ttf-font')
optdepends=('dolphin-emu: native Dolphin support'
            'flatpak: Flatpak Dolphin support')
conflicts=('wheelwizard')
provides=('wheelwizard')
source=("https://github.com/Team${_name}/${_name}/releases/download/${_pkgver}/WheelWizard_Linux"
        "https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/Flatpak/${_app_id}.desktop"
        "https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/Flatpak/${_app_id}-url-handler.desktop"
        "https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/Flatpak/${_app_id}.png"
        "https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/LICENSE")
sha256sums=('46c343e1dad5bb7b0ee6b8b29b71a0454e6c151a20055b08e9d0a5f3c3131aff'
            '38e89cae5e18ec818549571f98f6898f8dc72b2974a382983cb9897ac6421e01'
            'b94a3ce5115a77741ce5900738dcdac923f16738d850b2e1aa1bd7278d6d8311'
            'd055ae9b991da94d016598d93e36f0177c609598001240cc6cae96f6e564a1ee'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  sed -i "s/^Icon=.*$/Icon=${_name}/g" "$srcdir/${_app_id}.desktop"
  sed -i "s/^Icon=.*$/Icon=${_name}/g" "$srcdir/${_app_id}-url-handler.desktop"
}

package() {
  install -D -m0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m0755 "$srcdir/WheelWizard_Linux" "$pkgdir/usr/bin/${_name}"
  install -D -m0644 "$srcdir/${_app_id}.desktop" \
      "$pkgdir/usr/share/applications/${_name}.desktop"
  install -D -m0644 "$srcdir/${_app_id}-url-handler.desktop" \
      "$pkgdir/usr/share/applications/${_name}-url-handler.desktop"
  install -D -m0644 "$srcdir/${_app_id}.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_name}.png"
}
