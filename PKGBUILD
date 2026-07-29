# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname=micyou-bin
pkgver=1.3.5
pkgrel=2
pkgdesc="Turn your Android device into a high-quality wireless microphone for your PC"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('GPL-3.0')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'libappindicator' 'libgl' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
optdepends=(
  'android-tools: USB connectivity support'
  'xdg-utils: Open URLs in default browser'
)
provides=('micyou')
conflicts=('micyou')
options=('!strip')
source=("https://github.com/LanRhyme/MicYou/releases/download/v${pkgver}/MicYou-Linux-${pkgver}.deb"
  "https://raw.githubusercontent.com/LanRhyme/MicYou/refs/heads/master/LICENSE")
sha256sums=('b5137f85bb5d1f134af0ec52015975160a16c9e24a24a42408b1a262a0e740f6'
  '6b7271e1f40a0346a6dfb0c14df538d56add7f26502ba23f5109db94eedd66e9')
noextract=("MicYou-Linux-${pkgver}.deb")

package() {
  cd "$srcdir"

  # Extract deb
  bsdtar -xf MicYou-Linux-${pkgver}.deb
  bsdtar -xf data.tar.zst -C "$pkgdir"

  # Install desktop file
  install -Dm644 "$pkgdir/opt/micyou/lib/micyou-MicYou.desktop" "$pkgdir/usr/share/applications/micyou.desktop"

  # Install icon
  install -Dm644 "$pkgdir/opt/micyou/lib/MicYou.png" "$pkgdir/usr/share/pixmaps/micyou.png"

  # Create Symlink for command line execution
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/micyou/bin/MicYou" "$pkgdir/usr/bin/micyou"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/micyou/LICENSE"
}
