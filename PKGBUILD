# Maintainer: Advaith Gundu <ibcnag0mr@mozmail.com>

# This is a build of the patched experimental elanmoc2 driver by Davide Depau with support for the ELAN OCOO

pkgname=libfprint-elanmoc2-newdrvs-git
_pkgname=libfprint
pkgver=1.94.0+10+gd348f17
pkgrel=1
pkgdesc="Library for fingerprint readers with patches for the support of the ELAN 0C4C and 0C00."
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev)
makedepends=(git meson gtk-doc gobject-introspection)
checkdepends=(cairo)
conflicts=(libfprint)
provides=(libfprint=1.94.0 libfprint-2.so)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/geodic/libfprint.git#branch=elanmoc2")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
