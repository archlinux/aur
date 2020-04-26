# Maintainer: Timothy Gu <timothygu99@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=libfprint-git
_pkgname=libfprint
epoch=1
pkgver=1.90.1.r35.gd240230
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=('libgusb>=0.3.0' nss pixman)
makedepends=(git gobject-introspection gtk-doc 'meson>=0.49.0')
checkdepends=(python python-cairo python-gobject 'umockdev>=0.13.2')
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
