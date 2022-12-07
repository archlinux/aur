# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=shortwave
pkgver=3.1.0
pkgrel=2
epoch=1
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'gst-libav')
makedepends=('git' 'meson' 'cargo' 'wayland-protocols')
checkdepends=('appstream-glib')
_commit=de062d5f2a2f395bb2c3f8149793d4203593e912 # tags/3.1.0^0
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
