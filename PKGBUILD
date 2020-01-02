# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-git
_pkgname=libfprint
epoch=1
pkgver=1.90.0.r169.gb8e5584
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git meson gtk-doc gobject-introspection)
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/.r/;s/-/./'
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
