# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Max Devaine <maxdevaine@google.com>

pkgname=libtorrent-rasterbar-109
pkgver=1.0.9
pkgrel=1
epoch=1
pkgdesc="A C++ BitTorrent library that aims to be a good alternative to all the other implementations around"
url="http://www.rasterbar.com/products/libtorrent/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs' 'geoip' 'python2')
makedepends=('boost')
provides=("libtorrent-rasterbar")
conflicts=("libtorrent-rasterbar")
options=('!emptydirs')
source=(https://github.com/arvidn/libtorrent/archive/libtorrent-${pkgver//./_}/$pkgname-$pkgver.tar.gz)
sha1sums=('b52faaaf69442556a21445363f41967643b5f8de')

build() {
  cd libtorrent-libtorrent-${pkgver//./_}
  ./autotool.sh
  PYTHON=/usr/bin/python2 \
  ./configure \
    --prefix=/usr \
    --enable-python-binding \
    --with-libgeoip=system \
    --with-libiconv
  make
}

package() {
  cd libtorrent-libtorrent-${pkgver//./_}
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
