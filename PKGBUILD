# Maintainer: Răzvan Cojocaru <rzvncj@gmail.com>

pkgname=gdbuspp-git
pkgver=master_2bdab8188fe5a0c4
pkgrel=1
pkgdesc="glib2 D-Bus C++ interface"
arch=('x86_64')
url="https://codeberg.org/OpenVPN/gdbuspp"
license=('AGPLv3')
groups=()
depends=('glib2')
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
  cd "$srcdir/$pkgname"
  meson test -C build
}

package() {
  cd "$srcdir/$pkgname/"
  meson install -C build --destdir "$pkgdir"
}
