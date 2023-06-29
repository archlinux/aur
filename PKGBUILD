# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=2.2
pkgrel=1
pkgdesc="Play your music"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'taglib' 'tracker3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('a9c4cb51cb25e3b8332d15178e44c0ddedc4220b75bd8556a9716958c7a367004b5d8283f16054c9be861c39228c88d1443351d09fd8d7477398a73700ba6b89')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
