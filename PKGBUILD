# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname=micyou-bin
pkgver=2.0.1
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
  "https://raw.githubusercontent.com/LanRhyme/MicYou/refs/heads/master/LICENSE")
sha256sums=('e22259d77370ba5bae2c936827a148e0375681119fd803a62ea3f0a82f8ad7a0'
  '6b7271e1f40a0346a6dfb0c14df538d56add7f26502ba23f5109db94eedd66e9')
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
