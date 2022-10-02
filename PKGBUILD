# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=1.7
pkgrel=1
pkgdesc="Play your music"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'taglib' 'tracker3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('8c9bade24788d54160a2e1a0be167107072a96d25c8fccc60765e3026ffcb2fc41b6c518925c76b5f14724636402341c0dac07cc2ce0eb3fee3e0237537ad6b0')

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
