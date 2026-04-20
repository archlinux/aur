# Maintainer: faetalize

pkgname=waytator
pkgver=1.1.1
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
sha256sums=('e3c4b708f71d51e34b7712ea0dcc48b36b2d972fb54a3e952bf50dba5910e072')

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
