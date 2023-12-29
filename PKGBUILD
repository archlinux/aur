# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=3.4_1
pkgrel=1
pkgdesc="Play your music"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'taglib' 'tracker3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v${pkgver//_/-}/$pkgname-v${pkgver//_/-}.tar.gz)
b2sums=('9fca86717e612530b8612596112a3637acf0fea68055cddc1644aa28d4524c5e89613fdb5bd81567e3a9ebb4a844f708203d2daac8657e82f46c1a8283486ad3')

build() {
  arch-meson "$pkgname-v${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
