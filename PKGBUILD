# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-connections-git
_pkgname=connections
pkgver=41.alpha.r32.g44d257f
pkgrel=1
pkgdesc="A remote desktop client for the GNOME desktop environment"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/connections"
license=('GPL3')
depends=('gtk3' 'glib2' 'libhandy'  'gtk-vnc' 'libusb' 'freerdp' 'libxml' 'gtk-frdp')
makedepends=('git' 'itstool' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
