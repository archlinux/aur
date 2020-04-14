# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjcat
pkgver=0.1.1
pkgrel=1
pkgdesc="Library for reading and writing Jcat files"
arch=('i686' 'x86_64')
url="https://github.com/hughsie/libjcat"
license=('LGPL')
depends=('glibc' 'gpgme' 'json-glib')
makedepends=('meson' 'gobject-introspection' 'help2man' 'vala')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/hughsie/libjcat/archive/$pkgver.tar.gz")
sha256sums=('0b1fae2b1ca8658848ae20b190ae7a70b480730ac0342cc86b2c9aa48a5a2c46')


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
