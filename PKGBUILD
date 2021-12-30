# Maintainer: John Luebs <jkluebs@luebsphoto.com>

pkgname=dymo-cups-drivers
pkgver=1.4.0.5
pkgrel=4
_archive_ver=1.4.0
url=http://global.dymo.com/
pkgdesc="Official Dymo supplied Linux Cups drivers for LabelWriter series"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libcups')
makedepends=('wget')
DLAGENTS=('https::/usr/bin/wget -U Mozilla %u')
source=(https://download.dymo.com/Software/Linux/${pkgname}-${_archive_ver}.tar.gz
       cups-ppd-header.patch cups-2.6-api.patch)
sha256sums=('c60797e7e986ca329f46e9a6ab1cb6382383952b15685ed69fd91f3c7ed64f71'
            '3a11eaffc5295e4811721b1bd1e51d79ed5e2c5e7665d4be7fc9ce0579fd2a17'
            'd256baf5b651c97df1031fde666f9b3e44afbf7df06d42f9f20ae5eaf30d1afe')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/cups-ppd-header.patch"
  patch -Np1 -i "$srcdir/cups-2.6-api.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
