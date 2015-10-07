# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=libxpresent
pkgver=1.0.0
pkgrel=2
pkgdesc="Xlib-compatible API for the Present extension"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/lib/libXpresent/"
license=('custom')
depends=('libxext' 'libxfixes' 'libxrandr' 'presentproto')
makedepends=('xorg-util-macros')
source=("http://ftp.x.org/pub/individual/lib/libXpresent-$pkgver.tar.bz2"{,.sig})
sha256sums=('c11ae015141a9afbe10f4f2b8ee00b11adca6373dc1b9808d7c6c138b2da7b8a'
            'SKIP')
validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') # Keith Packard <keithp@keithp.com>

build() {
  cd "libXpresent-$pkgver"

  ./configure --prefix=/usr --disable-dependency-tracking
  make
}

package() {
  cd "libXpresent-$pkgver"

  # Install the library
  make DESTDIR="$pkgdir" install

  # Install the license
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
