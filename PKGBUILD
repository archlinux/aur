# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjcat
pkgver=0.1.0
pkgrel=1
pkgdesc="Library for reading and writing Jcat files"
arch=('i686' 'x86_64')
url="https://github.com/hughsie/libjcat"
license=('LGPL')
depends=('glibc' 'gpgme' 'json-glib')
makedepends=('meson' 'gobject-introspection' 'help2man' 'vala')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/hughsie/libjcat/archive/$pkgver.tar.gz")
sha256sums=('07bce18b9b4ddbfd3e106251a540884be0715047aaece7f53dcdaed1bd2f1b11')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    --libexecdir="/usr/lib" \
    "_build"
  ninja -C "_build"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  meson test -C "_build"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C "_build"
}
