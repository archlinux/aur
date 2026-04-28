# Maintainer: faetalize

pkgname=waytator
pkgver=1.2.2
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
sha256sums=('ed531d85791dbbf05e1ee0f2541f2b7dd4446555d22f08dd34e4609c443e7066')

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
