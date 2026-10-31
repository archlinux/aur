# Maintainer: dax
#
# Not a prebuilt of extra/hex (the hex dump tool, which installs /usr/bin/hx):
# this is the Hex voice dictation app, so it neither provides nor conflicts
# with it.
#
# Generated from anomalyco/hex packaging/aur by scripts/release-aur.sh, which
# sets pkgver, the release service's linux-x64 and linux-arm64 file URLs, and
# the checksums for each release.
pkgname=hex-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='Hex voice dictation app by Anomaly: hold a key, speak, and it types (Linux beta; not the hex dump tool)'
arch=('x86_64' 'aarch64')
url='https://github.com/anomalyco/hex'
license=('MIT')
# Linked: alsa-lib, gcc-libs, glibc, vulkan-icd-loader. Loaded at
# runtime: the X11/Wayland/xkbcommon client libraries and OpenBLAS.
depends=(
  'alsa-lib' 'curl' 'gcc-libs' 'glibc' 'libx11' 'libxcb' 'libxcursor'
  'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'openblas' 'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'wl-clipboard: paste on Wayland'
  'wtype: paste on Wayland'
  'vulkan-driver: GPU transcription'
  'wireplumber: mute output while dictating (or libpulse for pactl)'
  'xdg-utils: open links from voice commands'
)
options=('!strip' '!debug')
install=hex-bin.install
source=(
  'hex.desktop'
  'hex.service'
  'LICENSE'
)
source_x86_64=("hex-${pkgver}-linux-x64::https://anoma.ly/release/hex/files/5541eb3fdf971813ce72a9ada04f43ea09ebb90f9545fabca648adc9b4e3349c/hex")
source_aarch64=("hex-${pkgver}-linux-arm64::https://anoma.ly/release/hex/files/f43a7a3b4c6d432599f830aceaaae957b13b57bc60b6a6655a4d88ddd6a66d4a/hex")
sha256sums=('4c633c0cc9c32a22601bf7d62e4f924505b008017c89b8a7a0830792010de8b9'
            '7b7f3baa337f53b46574e4ea16d98f45c066ddcfc9cfd13bc255f5d4ce628652'
            '0c267f186f600c6f4d9d229d1792861361f2c433cfb23054fece61f227006344')
sha256sums_x86_64=('5541eb3fdf971813ce72a9ada04f43ea09ebb90f9545fabca648adc9b4e3349c')
sha256sums_aarch64=('f43a7a3b4c6d432599f830aceaaae957b13b57bc60b6a6655a4d88ddd6a66d4a')

package() {
  local target=x64
  [ "$CARCH" = aarch64 ] && target=arm64
  install -Dm755 "hex-${pkgver}-linux-${target}" "$pkgdir/usr/bin/hex"
  install -Dm644 hex.desktop "$pkgdir/usr/share/applications/hex.desktop"
  install -Dm644 hex.service "$pkgdir/usr/lib/systemd/user/hex.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
