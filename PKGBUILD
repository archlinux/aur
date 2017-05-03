# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

pkgname=snappy-static
_pkgname=snappy
pkgver=1.1.4
pkgrel=1
pkgdesc='A fast compressor/decompressor library'
arch=('i686' 'x86_64')
url="https://google.github.io/snappy/"
license=('BSD')
depends=('glibc' 'gcc-libs')
provides=('snappy')
conflicts=('snappy')
checkdepends=('zlib')
options=('staticlibs')
source=("https://github.com/google/snappy/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('c328993b68afe3e5bd87c8ea9bdeb028')

build() {
  cd "$_pkgname-$pkgver"

  # compile without assertions
  CXXFLAGS+=" -DNDEBUG -fPIC"

  ./configure --prefix=/usr
  make
}

check() {
  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  make -C "$_pkgname-$pkgver" check
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/snappy/LICENSE"
}

# vim:set ts=2 sw=2 et:
