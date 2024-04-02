# Mantainer: Andrea De Bellis <spiralprojectss@gmail.com>
# Contributor: Johnathon Clark <john.clark at cantab dot net> (Original Author)
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org> 
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

# This is a build of the experimental elanmoc2 driver by Davide Depau

pkgname=libfprint-elanmoc2-working-git
_pkgname=libfprint
pkgver=1.94.0+276+g3d489eb
pkgrel=1
pkgdesc="Library for fingerprint readers with patches for the support of the ELAN 0C4C & 0C00."
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev)
makedepends=(git meson gtk-doc gobject-introspection)
checkdepends=(cairo)
conflicts=(libfprint)
provides=(libfprint=1.94.0 libfprint-2.so)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/Depau/libfprint.git#branch=elanmoc2-working")
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
