# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.4.1
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/decoder"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'pipewire' 'zbar')
makedepends=('meson' 'cargo' 'clang')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('66b279fcdeeaa753c0bfda41c308c2d471ec9ff95054fe09e333765d2bb851df268ac7926d0f0375edab7d7dd962cc7b0ef93f6ae9ec640bed2dd5991b49eab0')

build() {
  arch-meson --buildtype release "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
