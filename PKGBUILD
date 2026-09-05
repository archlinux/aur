# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname=micyou-bin
pkgver=2.0.2
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
sha256sums=('5bd542d2994ca63aa1f3d284aaf239262e00fa5074514cde28c059c49ec982cf'
  'b2d978587221c30ebb47e9912a4c1063cb1a142652d8eda1fe553e9a798881bf')
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
