# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol-git
pkgver=0.9.2.r3.gd58183f
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
