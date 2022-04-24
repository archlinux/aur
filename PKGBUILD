# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=shortwave
_pkgname=Shortwave
pkgver=3.0.0
pkgrel=1
epoch=1
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('glib2' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'libadwaita' 'libshumate')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
#options=('!emptydirs')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('8f1677582815371304595068012019e50b4b9c8c31a351eaeb9bb0443d79ab8c74f21e3809100e6308cfb5bfef5e6465c38957eae45e669c186fe2d32e44bcae')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
