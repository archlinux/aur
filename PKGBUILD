# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=purism-stream-git
_pkgname=Stream
pkgver=0.1.6.r10.g2c897eb
pkgrel=1
pkgdesc="YouTube client for GNOME, built for the Librem 5"
arch=('x86_64')
url="https://source.puri.sm/todd/Stream"
license=('GPL3')
depends=('libhandy' 'python-gobject' 'pulseaudio')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
