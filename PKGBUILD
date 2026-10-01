# Maintainer: look997 <look997@gmail.com>
#
# Jednoplikowa aplikacja GTK4/libadwaita: jeden kadr dla wielu obrazów.
# Bez etapów budowania — instalujemy pliki wprost z tagu v$pkgver.
pkgname=kadr
pkgver=1.0.0
pkgrel=1
pkgdesc='Kadrowanie zbiorcze — ten sam kadr dla wielu obrazów naraz (GTK4/libadwaita)'
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
# Moduły gdk-pixbuf decydują o tym, które formaty da się otworzyć i zapisać.
# Bez nich działa PNG/JPEG (i wszystko, co jest w cache'u), reszta nie.
optdepends=(
  'libheif: HEIF/AVIF'
  'librsvg: SVG'
  'libtiff: TIFF'
  'libwebp: WebP'
  # oryginalne okna menedżera plików do przycisków „Pokaż w folderze”
  'nemo: pokazywanie zapisanych plików z zaznaczeniem (org.freedesktop.FileManager1 ShowItems)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('01fd5458a1d8a9409d80a52205faa311655ae47e94c03aedaf24b175d09d6cc1')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kadr "$pkgdir/usr/bin/kadr"
  install -Dm644 local.Kadr.desktop "$pkgdir/usr/share/applications/local.Kadr.desktop"
  install -Dm644 local.Kadr.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/local.Kadr.svg"
}