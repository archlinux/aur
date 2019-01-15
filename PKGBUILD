# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=libfprint
pkgname=libfprint-vfs0090-git
epoch=1
pkgver=0.99.0.r91.g2e2e382
pkgrel=1
pkgdesc="Library for fingerprint readers (includes WIP libre vfs0090 driver)"
arch=(i686 x86_64)
url="https://github.com/3v1n0/libfprint"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl)
makedepends=(git meson gtk-doc)
optdepends=("fprintd: D-Bus daemon that manages fingerprint readers")
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
replaces=(libfprint-vfs0090)
source=("git+https://github.com/3v1n0/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "$srcdir"
  arch-meson $_pkgname build -D x11-examples=false -D doc=false
  ninja -C build
}
package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}
