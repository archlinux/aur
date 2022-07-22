# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=livi
pkgver=0.0.2
pkgrel=1
pkgdesc="A simple GTK4 based video player for mobile phones"
arch=('x86_64' 'aarch64')
url="https://source.puri.sm/guido.gunther/livi"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'x264' 'libgudev')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('a70d5191c472b84d7db784003fb33fbc414fd59353407fc21d74a4157efd2c27010eee96555189931f4f48c271bb9cd34997806c151334fc98d3be47f5a06ee3')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
