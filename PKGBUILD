# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.3.3
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/decoder"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'pipewire' 'zbar')
makedepends=('meson' 'cargo' 'clang')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('f8913bcc95d6e85ece7edbe10d603b7342cebc4277d3e21a1f7e8b346862b5731b0184eb236d0c0919b3a0eb03112742ed955bd2ef66f7433bc52b79c81af4d9')

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
