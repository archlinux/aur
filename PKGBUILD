# Maintainer: John Luebs <jkluebs at luebsphoto dot com>

pkgname=dymo-cups-drivers
pkgver=1.4.0.5
pkgrel=3
_archive_ver=1.4.0
url=http://global.dymo.com/
pkgdesc="Official Dymo supplied Linux Cups drivers for LabelWriter series"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libcups')
source=(http://download.dymo.com/Software/Linux/${pkgname}-${_archive_ver}.tar.gz
       cups-ppd-header.patch)
sha256sums=('c60797e7e986ca329f46e9a6ab1cb6382383952b15685ed69fd91f3c7ed64f71'
            '3a11eaffc5295e4811721b1bd1e51d79ed5e2c5e7665d4be7fc9ce0579fd2a17')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/cups-ppd-header.patch"
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
