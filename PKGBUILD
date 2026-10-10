# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname=micyou-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Turn your Android device into a high-quality wireless microphone for your PC"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('GPL-3.0-only' 'MIT')
depends=('alsa-lib' 'glibc' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'pipewire' 'wireplumber')
optdepends=(
  'android-tools: USB connectivity support'
  'xdg-utils: Open URLs in default browser'
)
provides=('micyou')
conflicts=('micyou' 'micyou-git')
options=('!strip')
source=("https://github.com/LanRhyme/MicYou/releases/download/v${pkgver}/MicYou-Linux-${pkgver}.deb"
  "https://raw.githubusercontent.com/LanRhyme/MicYou/v${pkgver}/LICENSE")
sha256sums=('5811aed1662619d6ac0e3b21955d4153f2d3c3a0bd464a248690b16b6b7b6788'
  '9638e134977de4ee0c9745cf94e3a2c64c2252f88057fd5092731b9d74e75816')
noextract=("MicYou-Linux-${pkgver}.deb")

package() {
  cd "$srcdir"

  # Extract deb
  bsdtar -xf MicYou-Linux-${pkgver}.deb
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/micyou/LICENSE"
  install -Dm644 "$pkgdir/usr/lib/micyou/resources/LICENSE-AEC7.txt" "$pkgdir/usr/share/licenses/micyou/LICENSE-AEC7.txt"
  install -Dm644 "$pkgdir/usr/lib/micyou/resources/LICENSE-PureVox.txt" "$pkgdir/usr/share/licenses/micyou/LICENSE-PureVox.txt"
}
