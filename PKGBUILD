# Maintainer: faetalize

pkgname=waytator
pkgver=1.3.1
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
sha256sums=('00639aa47dee838bb8fad316b37e0675ec20c68b1fd69efbcd61eb537af7e0c4')

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
