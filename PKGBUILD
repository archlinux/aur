# Maintainer: faetalize

pkgname=waytator
pkgver=1.2.0
pkgrel=1
pkgdesc='Screenshot annotator and lightweight image editor'
arch=('x86_64')
url='https://github.com/faetalize/waytator'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita')
optdepends=('tesseract: OCR support')
makedepends=('meson' 'ninja' 'pkgconf')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/faetalize/waytator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ea0afb968d5d86e5b832ae7eb0ba0b6a7d428c24cb9b9855eaa0f7298fc6c04')

build() {
  local meson_options=(
    --buildtype=release
  )

  arch-meson "$pkgname-$pkgver" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
