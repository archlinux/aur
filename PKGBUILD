# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=shortwave
_pkgname=Shortwave
pkgver=3.0.0
pkgrel=2
epoch=1
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('8b196fa1e26802fac2d7b26bd22080f1fa6f7a619ae85ba0035edfb6f962bd72e94d71b6b3645ac5a42e2e6e54935390d2235f2c74411995910395521e670b65')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
