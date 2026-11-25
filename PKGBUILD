# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=transom-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Sharp remote desktops over RDP (GTK 4, HiDPI-correct) (Pre-compiled Binary)"
arch=('x86_64')
url="https://github.com/jm2/transom"
license=('GPL-3.0-or-later' 'Apache-2.0')
# The release binary is already stripped, so there is no debug info to split out.
options=('!debug')
depends=(
  'freerdp'
  'gtk4>=4.16'
  'libadwaita>=1.6'
  'libsecret'
  'hicolor-icon-theme'
  'ffmpeg'
)
optdepends=(
  'libva-mesa-driver: hardware H.264 decoding on AMD (zero-copy video)'
  'intel-media-driver: hardware H.264 decoding on Intel (zero-copy video)'
  'vulkan-icd-loader: GTK''s Vulkan renderer, needed to show hardware-decoded video'
)
provides=("transom=${pkgver}")
conflicts=('transom')
# Use the official Arch pre-compiled package as the source
source=("${pkgname}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/transom-${CARCH}.pkg.tar.zst")
sha256sums=('89f4f0b3b36fb7e94e5c6ed08064d880ef738e59cf8cac106dcf3c3234aa3176')

package() {
  # The source is a .pkg.tar.zst which makepkg extracts to $srcdir.
  # Copy its payload (everything under usr/) to $pkgdir.
  cp -av "$srcdir"/usr "$pkgdir/"

  # Ensure the license directory matches the package name for AUR standards
  if [ -d "$pkgdir/usr/share/licenses/transom" ]; then
    mv "$pkgdir/usr/share/licenses/transom" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
