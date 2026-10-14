# Maintainer: faetalize

pkgname=waytator
pkgver=1.3.0
pkgrel=1
pkgdesc='Screenshot annotator and lightweight image editor'
arch=('x86_64')
url='https://github.com/faetalize/waytator'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'wayland' 'wl-clipboard' 'adwaita-icon-theme')
optdepends=('tesseract: OCR support'
            'xdg-desktop-portal: screenshots on compositors without wlr-screencopy')
makedepends=('meson' 'ninja' 'pkgconf' 'wayland-protocols')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/faetalize/waytator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d08d7447955e0c306c2c0aebd960f3affd602c78e7ef603cedddd15737ed45a')

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
