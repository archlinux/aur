# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=1.5
pkgrel=1
pkgdesc="Play your music"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'taglib' 'tracker3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('3beda7e32f9ac1c9647b69e967191431bc6fc8baa3d250eb0df1031f3e4241cfbea9b1b61fc8fdd2dea30372035e8f14b4e7aeefb36a0c98e91f765741b59642')

build() {
  arch-meson --buildtype release "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
