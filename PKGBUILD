# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder-git
pkgver=0.3.1.r17.g8235821
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/decoder"
license=('GPL3')
depends=('libadwaita>=1:1.2.0' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'pipewire' 'zbar')
makedepends=('git' 'meson' 'cargo' 'clang')
checkdepends=('appstream-glib')
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
