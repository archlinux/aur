# Maintainer: swindlesmccoop@waifu.club
pkgname=wheelwizard-bin
_name=WheelWizard
_app_id=io.github.TeamWheelWizard.WheelWizard
pkgver=2.6.4
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
source=("${_name}-${pkgver}_Linux::https://github.com/Team${_name}/${_name}/releases/download/${_pkgver}/WheelWizard_Linux"
        "${_app_id}-${pkgver}.desktop::https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/Flatpak/${_app_id}.desktop"
        "${_app_id}-url-handler-${pkgver}.desktop::https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/Flatpak/${_app_id}-url-handler.desktop"
        "${_app_id}-${pkgver}.png::https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/Flatpak/${_app_id}.png"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Team${_name}/${_name}/${_pkgver}/LICENSE")
sha256sums=('5c7d9ec43119aeaa2942d8c658270201ba09b9fa57cdc27b95e9efa6bf969a35'
            'ff89e34e08cd2255c7ea2d4efc0108dd22b7b259802c07f5b6845350bedf54ce'
            '2ecb703c0dc55c4f79ce93ab374914dba260d6e977df6b9d1af59e0e3a6a9c1c'
            'd055ae9b991da94d016598d93e36f0177c609598001240cc6cae96f6e564a1ee'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  sed -i "s/^Icon=.*$/Icon=${_name}/g" "$srcdir/${_app_id}-${pkgver}.desktop"
  sed -i "s/^Icon=.*$/Icon=${_name}/g" "$srcdir/${_app_id}-url-handler-${pkgver}.desktop"
}

package() {
  install -D -m0644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m0755 "$srcdir/${_name}-${pkgver}_Linux" "$pkgdir/usr/bin/${_name}"
  install -D -m0644 "$srcdir/${_app_id}-${pkgver}.desktop" \
      "$pkgdir/usr/share/applications/${_name}.desktop"
  install -D -m0644 "$srcdir/${_app_id}-url-handler-${pkgver}.desktop" \
      "$pkgdir/usr/share/applications/${_name}-url-handler.desktop"
  install -D -m0644 "$srcdir/${_app_id}-${pkgver}.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_name}.png"
}
