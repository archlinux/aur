# Maintainer: look997 <look997@gmail.com>
#
# Single-file GTK4/libadwaita application: one crop for multiple images.
# No build step — install files directly from the v$pkgver tag.
pkgname=kadr
pkgver=1.2.4
pkgrel=1
pkgdesc='Batch crop multiple images with the same crop area (GTK4/libadwaita)'
arch=('x86_64')
url='https://github.com/look997/kadr'
license=('MIT')
depends=(
  gdk-pixbuf2
  gtk4
  libadwaita
  python-cairo
  python-gobject
)
# Gdk-pixbuf modules determine which image formats can be opened and saved.
# Without them, PNG/JPEG (and cached formats) are supported.
optdepends=(
  'libheif: HEIF/AVIF'
  'librsvg: SVG'
  'libtiff: TIFF'
  'libwebp: WebP'
  'nemo: show saved files selected in the file manager (org.freedesktop.FileManager1 ShowItems)'
)
# Use the v$pkgver release asset rather than the full tag snapshot, which includes
# screenshots and demo.gif (1.2 MB) to install a 56 kB application.
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/kadr-$pkgver.tar.gz")
sha256sums=('d5b5a72e75b9f257b9cb6e7f8188f3a399171df55da4f67af45e1dc82442ff2c')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kadr "$pkgdir/usr/bin/kadr"
  if [[ -f io.github.look997.kadr.desktop ]]; then
    install -Dm644 io.github.look997.kadr.desktop "$pkgdir/usr/share/applications/io.github.look997.kadr.desktop"
    install -Dm644 io.github.look997.kadr.svg \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.look997.kadr.svg"
    install -Dm644 io.github.look997.kadr.metainfo.xml \
      "$pkgdir/usr/share/metainfo/io.github.look997.kadr.metainfo.xml"
  else
    install -Dm644 org.kadr.kadr.desktop "$pkgdir/usr/share/applications/org.kadr.kadr.desktop"
    install -Dm644 org.kadr.kadr.svg \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.kadr.kadr.svg"
    install -Dm644 org.kadr.kadr.metainfo.xml \
      "$pkgdir/usr/share/metainfo/org.kadr.kadr.metainfo.xml"
  fi
  install -Dm644 locale/en/LC_MESSAGES/kadr.mo \
    "$pkgdir/usr/share/locale/en/LC_MESSAGES/kadr.mo"
}