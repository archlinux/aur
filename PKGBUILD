# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=zap-soundboard-git
pkgver=1.2.0.r0.gcb1fe5a
pkgrel=1
pkgdesc="Play sounds from a soundboard"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/rmnvgr/zap"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'tracker3')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-soundboard-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-soundboard-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
