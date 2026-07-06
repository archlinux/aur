# Maintainer: Filip Spanne <filip.spanne@gmail.com>

pkgname=libfprint-elanpress-git
_pkgname=libfprint
pkgver=1.94.10.r1.gd6d57d7
pkgrel=1
pkgdesc="libfprint with the elanpress driver for ELAN 04f3:0c6e press sensors (ASUS ROG Flow X13 and other ASUS laptops)"
url="https://github.com/filip-rs/libfprint"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(libgusb pixman nss systemd libgudev glib2)
makedepends=(git meson gobject-introspection glib2-devel)
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://github.com/filip-rs/libfprint.git#branch=elanpress")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build -Ddoc=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
