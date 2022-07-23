# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=passbook-git
pkgver=0.8.r36.g750825d
pkgrel=1
pkgdesc="Password manager for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/Passbook"
license=('GPL3')
depends=('gtk3' 'python-cairo' 'python-gobject')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
optdepends=('python-pykeepass: Support for keepass files')
provides=('passbook')
conflicts=('passbook')
source=('git+https://gitlab.gnome.org/gnumdk/passbook.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/passbook"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson passbook build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
