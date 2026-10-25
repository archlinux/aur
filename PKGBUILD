# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=balun-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight cross-platform HDHomeRun live TV viewer (Pre-compiled Binary)"
arch=('x86_64')
url="https://github.com/jm2/balun"
license=('GPL-3.0-or-later')
# The release binary is already stripped, so there is no debug info to split out.
options=('!debug')
depends=(
  'glibc'
  'libgcc'
  'gtk4>=4.16'
  'libadwaita>=1.6'
  'gstreamer>=1.20'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad-libs'
  'gst-plugin-gtk4'
  'gst-libav'
)
provides=("balun=${pkgver}")
conflicts=('balun')
# Use the official Arch pre-compiled package as the source
source=("${pkgname}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/balun-${CARCH}.pkg.tar.zst")
sha256sums=('00facdd70955ee2f68f999d2e3156c71fcb82abc6326946acbfb7910e828a6c8')

package() {
  # The source is a .pkg.tar.zst which makepkg extracts to $srcdir.
  # Copy its payload (everything under usr/) to $pkgdir.
  cp -av "$srcdir"/usr "$pkgdir/"

  # Ensure the license directory matches the package name for AUR standards
  if [ -d "$pkgdir/usr/share/licenses/balun" ]; then
    mv "$pkgdir/usr/share/licenses/balun" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
