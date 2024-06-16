# Maintainer: Răzvan Cojocaru <rzvncj@gmail.com>

pkgname=gdbuspp-git
pkgver=makepkg_7d80f553d64ec647
pkgrel=1
pkgdesc="glib2 D-Bus C++ interface"
arch=('x86_64')
url="https://codeberg.org/OpenVPN/gdbuspp"
license=('AGPLv3')
groups=()
depends=('glib2' 'python-xmltodict')
makedepends=('meson')
source=("$pkgname::git+https://codeberg.org/OpenVPN/gdbuspp.git")
sha256sums=('SKIP')
provides=("$pkgname")
conflicts=("$pkgname")

pkgver() {
  cd "$srcdir/$pkgname"
  ./scripts/get-git-ref
}

build() {
  cd "$srcdir/$pkgname"
  arch-meson build
  meson compile -C build
}

check() {
  #
  # Checks are disabled for now, because it is required that they
  # run in the same D-Bus session as the originally logged-in user.
  # That means that even running them with "sudo --user #<UID>"
  # (like pikaur does) will cause them to fail in an irrelevant way.
  #
  # cd "$srcdir/$pkgname"
  # meson test -C build
}

package() {
  cd "$srcdir/$pkgname/"
  meson install -C build --destdir "$pkgdir"
}
