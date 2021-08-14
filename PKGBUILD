# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-metronome-git
_pkgname=metronome
pkgver=1.0.0.r0.g43f1728
pkgrel=1
pkgdesc="Practice music with a regular tempo"
arch=('x86_64')
url="https://gitlab.gnome.org/aplazas/metronome"
license=('GPL3')
depends=('glib2' 'gstreamer' 'gst-plugins-base' 'libsass' 'sassc' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${_pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
