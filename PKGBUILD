# Maintainer: Răzvan Cojocaru <rzvncj@gmail.com>

pkgname=gdbuspp-git
pkgver=master_27ec3ecdccebf946
pkgrel=1
pkgdesc="glib2 D-Bus C++ interface"
arch=('x86_64')
url="https://codeberg.org/OpenVPN/gdbuspp"
license=('AGPL-3.0-only')
groups=()
depends=('glib2' 'python-xmltodict')
makedepends=('meson')
source=("$pkgname::git+https://codeberg.org/OpenVPN/gdbuspp.git")
sha256sums=('SKIP')
provides=("gdbuspp")
conflicts=("gdbuspp")

pkgver() {
  cd "$srcdir/$pkgname"
  ./scripts/get-git-ref
}

build() {
  cd "$srcdir/$pkgname"
  arch-meson build
  meson compile -C build
}

#
# Checks are disabled for now, because it is required that they
# run in the same D-Bus session as the originally logged-in user.
# That means that even running them with "sudo --user #<UID>"
# (like pikaur does) will cause them to fail in an irrelevant way.
#
# check() {
#   cd "$srcdir/$pkgname"
#   meson test -C build
# }

package() {
  cd "$srcdir/$pkgname/"
  meson install -C build --destdir "$pkgdir"
}
