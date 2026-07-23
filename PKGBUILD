# Maintainer: Lemmy <studio@quadbyte.net>

pkgname=swash
pkgver=1.5.0
pkgrel=1
pkgdesc='Fast screenshot annotator and lightweight image editor'
arch=('x86_64' 'aarch64')
url='https://github.com/ItsLemmy/swash'
license=('GPL-3.0-or-later')
options=('!debug')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4>=4.10'
  'libadwaita>=1.6'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
optdepends=('tesseract: OCR text recognition')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43e79fd54c6c9dc6045cfe337ba44986902ce69788c794252c46b4297aad5c61')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
