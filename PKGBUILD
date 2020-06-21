# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=libfprint
pkgname=libfprint-vfs0090-git
epoch=1
pkgver=1.90.1.r0.g82aed23
pkgrel=2
pkgdesc="Library for fingerprint readers (includes libre vfs0090 driver)"
arch=(i686 x86_64)
url="https://github.com/3v1n0/libfprint"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl)
makedepends=(git meson gtk-doc)
optdepends=("fprintd: D-Bus daemon that manages fingerprint readers")
groups=(fprint-git)
provides=(libfprint libfprint-2.so=2-64)
conflicts=(libfprint)
replaces=(libfprint-vfs0090)
source=("git+https://github.com/3v1n0/libfprint.git#branch=vfs0090")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed -e 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g' -e 's/^v//g' -e 's/+vfs009.\..//g'
}

build() {
  msg2 "================================= Note ====================================="
  msg2 "This package is being renamed to libfprint-vfs009x-git since it now supports"
  msg2 "both vfs0090 and vfs0097 sensors. Please switch to the new package as this"
  msg2 "one will be deleted soon."
  msg2 "============================================================================"

  cd "$srcdir"
  arch-meson $_pkgname build -D x11-examples=false -D doc=false
  ninja -C build
}
package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}
