# Maintainer: Lemmy <studio@quadbyte.net>

pkgname=swash
pkgver=1.4.0
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
sha256sums=('fae38eb499116c4579c115d9e9c003d4e0901947b12a046e3583eb8e887d15f5')

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
