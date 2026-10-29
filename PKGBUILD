# Maintainer: faetalize

pkgname=waytator
pkgver=1.5.1
pkgrel=1
pkgdesc='Screenshot and screen recording tool with an image and video editor'
arch=('x86_64')
url='https://github.com/faetalize/waytator'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'wayland' 'wl-clipboard'
         'ffmpeg' 'libpipewire' 'rubberband' 'mesa' 'libglvnd')
optdepends=('tesseract: OCR support'
            'xdg-desktop-portal: screen recording, and screenshots on compositors without wlr-screencopy'
            'gifski: better looking GIF export')
makedepends=('meson' 'ninja' 'pkgconf' 'wayland-protocols' 'libdrm')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/faetalize/waytator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58506f65e2fe27082be2d0fec60b7ba6d33c8468036b5da8a5bc4d62919da856')

build() {
  local meson_options=(
    --buildtype=release
  )

  # a build folder left from an older version would still point at its sources
  rm -rf build
  arch-meson "$pkgname-$pkgver" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
