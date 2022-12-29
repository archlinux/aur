# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjcat-git
pkgver=0.1.12.r5.ge81185d
pkgrel=1
pkgdesc="Library for reading and writing Jcat files"
arch=('i686' 'x86_64')
url="https://github.com/hughsie/libjcat"
license=('LGPL')
depends=('glibc' 'gpgme' 'json-glib')
makedepends=('git' 'gobject-introspection' 'help2man' 'meson' 'vala')
provides=("libjcat=$pkgver")
conflicts=('libjcat')
options=('staticlibs')
source=("git+https://github.com/hughsie/libjcat.git")
sha256sums=('SKIP')


pkgver() {
  cd "libjcat"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libjcat"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    --libexecdir="/usr/lib" \
    -Ddefault_library="both" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "libjcat"

  meson test -C "_build"
}

package() {
  cd "libjcat"

  meson install -C "_build" --destdir "$pkgdir"
}
