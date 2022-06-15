# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=0.6
pkgrel=1
pkgdesc="Play your music"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'taglib' 'tracker3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('fd2bedfb6bf562d059cafcf67d2d23f2be9c1f5ddd4cc6b01e3374b1d4eb6d9f547169706eee9ec5688d89bdc9f2133178ded2ebd3e2089928fd358892f0e00a')

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
