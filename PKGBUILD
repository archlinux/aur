# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=tributary-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A high-performance, Rhythmbox-style media manager (Pre-compiled Binary)"
arch=('x86_64')
url="https://github.com/jm2/tributary"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'gstreamer'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'dbus'
)
provides=('tributary')
conflicts=('tributary')
# Use the official Arch pre-compiled package as the source
source=("${pkgname}-${pkgver}.pkg.tar.zst::${url}/releases/download/v${pkgver}/tributary-x86_64.pkg.tar.zst")
sha256sums=('e4c5012a73174466dbc65d99d86a7757806b9206eb4d6a5f8c3d40f07a017de2')

package() {
  # The source is a .pkg.tar.zst which makepkg extracts to $srcdir.
  # We copy its contents to $pkgdir.
  # Using find to copy everything except the src directory if it exists
  cp -av "$srcdir"/usr "$pkgdir/"
  
  # Ensure the license directory matches the package name for AUR standards
  if [ -d "$pkgdir/usr/share/licenses/tributary" ]; then
    mv "$pkgdir/usr/share/licenses/tributary" "$pkgdir/usr/share/licenses/$pkgname"
  fi
}
