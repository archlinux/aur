# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.3.1
pkgrel=3
pkgdesc='Scan and Generate QR Codes'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/decoder"
license=('GPL3')
depends=('libadwaita>=1:1.2.0' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'pipewire' 'zbar')
makedepends=('meson' 'cargo' 'clang')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('d7ff26bd61ced48862ce26955a7989644222c4b2cc101e4ad5f5fec54cffad73c7f34401adc8cd4762eab2b1335985c97e398742c22d222309d24b22c25a9098')

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
