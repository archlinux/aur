
# Maintainer: Koolaid <hasoy678 at gmail dot com>

pkgname=telescope-webcam-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Use your Android phone as a webcam on Linux"
arch=('x86_64')
url="https://github.com/LunarKittyy/Telescope"
license=('AGPL-3.0-only')
depends=('v4l2loopback-dkms')
optdepends=(
  'android-tools: USB connection to Android phones'
  'linux-headers: DKMS build for the standard Arch kernel'
)
options=('!strip')

_appimage="Telescope-${pkgver}.AppImage"

source=(
  "${_appimage}::https://github.com/LunarKittyy/Telescope/releases/download/v${pkgver}/Telescope-x86_64.AppImage"
  "LICENSE::https://raw.githubusercontent.com/LunarKittyy/Telescope/v${pkgver}/LICENSE"
  'telescope-webcam'
  'telescope.desktop'
  'telescope.png'
)

noextract=("${_appimage}")

sha256sums=(
  '5458b4c1f967897fe75076e1c9be20e73c72e974113f115fb5b04951828f229c'
  '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
  '46d6f8b33572053efb5be34db75de58a2b70f319c02b7fc020439b0228b957dc'
  'c82a1085fece25905fe09566550372b66107af0cda29ca88d137ca4b449a600c'
  'c1c79c95b0b96d1bf98b5d8183e5843fa85c70d0f99cc08caae71fe015f56b45'
)

package() {
  install -Dm755 "$srcdir/${_appimage}" \
    "$pkgdir/opt/${pkgname}/Telescope.AppImage"

  install -Dm644 "$srcdir/telescope.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/telescope.png"

  install -Dm755 "$srcdir/telescope-webcam" \
    "$pkgdir/usr/bin/telescope-webcam"

  install -Dm644 "$srcdir/telescope.desktop" \
    "$pkgdir/usr/share/applications/telescope.desktop"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
