# Maintainer: Lemmy <studio@quadbyte.net>

pkgname=swash
pkgver=1.5.1
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
sha256sums=('52bce8e9e597fd4a33747e8e09e04aac715d7541797bef890d206e7eaaf4c9df')

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
