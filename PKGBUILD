# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.5.5
pkgrel=2
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://github.com/jcupitt/libvips"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif')
optdepends=('python2: vipsprofile')
# less used depends: 'libwebp' 'cfitsio'
# optional makedepends: 'v4l-utils' 'python2'
# minimal depends: 'libxml2'
options=('!libtool')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0891af4531d6f951a16ca6d03020b73796522d5fcf7c6247f2f04c896ecded28')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  # fix vipsprofile - bug reported and can be removed by 8.6.0
  sed -i 's|^#!.*python$|&2|' "$pkgdir/usr/bin/vipsprofile"
}
