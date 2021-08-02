# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-connections-git
_pkgname=connections
pkgver=41.alpha.r20.g3ee04f0
pkgrel=1
pkgdesc="A remote desktop client for the GNOME desktop environment"
arch=('any')
url="https://gitlab.gnome.org/GNOME/connections"
license=('GPL3')
depends=('gtk3' 'libhandy'  'gtk-vnc' 'libusb' 'freerdp' )
makedepends=('git' 'meson' 'vala')
optdepends=('libxml' 'gtk-frdp')
source=(git+$url.git)
md5sums=(SKIP) #autofill using updpkgsums

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
