# Maintainer: gborzi <gborzi@ieee.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-1
_pkgname=libfprint
pkgver=1.0
pkgrel=1
pkgdesc="Library for fingerprint readers - old stable version"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git meson gtk-doc)
provides=('libfprint=1.0')
groups=(fprint)
_commit=823f2c1067a27deae4153dd9ece6ce24bedc0680  # tags/V_1_0^0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build -D x11-examples=false -D gtk-examples=false
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
