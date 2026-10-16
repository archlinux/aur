# Maintainer: faetalize

pkgname=waytator
pkgver=1.4.0
pkgrel=1
pkgdesc='Screenshot annotator and lightweight image editor'
arch=('x86_64')
url='https://github.com/faetalize/waytator'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'wayland' 'wl-clipboard')
optdepends=('tesseract: OCR support'
            'xdg-desktop-portal: screenshots on compositors without wlr-screencopy')
makedepends=('meson' 'ninja' 'pkgconf' 'wayland-protocols')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/faetalize/waytator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fda02466c98ad0bc6cc1bce0be1c19e64c9dfe5b85a43480098821e649df1eb')

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
