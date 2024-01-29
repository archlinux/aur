# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=3.5.1
pkgrel=1
pkgdesc="Play your music"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'taglib' 'tracker3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('e07c988cb7a58595516f3eb0e924426f532d3509020b05902e1d16098d951da23d3932516ed37c3d8740a24af3510eea3d4cb6f09a11d5fd6f7f34e089541cea')

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
