# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

_name=libplist
pkgname=$_name-2.0-3
pkgver=2.2.0
pkgrel=1
pkgdesc="Library to handle Apple Property List files (libplist-2.0.so.3, libplist++-2.0.so.3)"
arch=('x86_64')
url="https://libimobiledevice.org/"
license=('LGPL-2.1-or-later')
source=("https://github.com/libimobiledevice/$_name/releases/download/$pkgver/$_name-$pkgver.tar.bz2")
sha256sums=('4a5517e5377ec421df84c586ba85bb4e1d26f11ad203d7d450a907c0156fbd9a')

build() {
  cd "$_name-$pkgver"

  ./configure --prefix=/usr --disable-static --without-cython
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "$_name-$pkgver"

  make check
}

package() {
  cd "$_name-$pkgver"

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{bin,include,lib/{libplist-2.0.so,libplist++-2.0.so,pkgconfig},share}
}
