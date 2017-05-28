# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.5.5
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://github.com/jcupitt/libvips"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif' 'swig')
optdepends=('python2: vipsprofile')
# less used depends: 'libwebp' 'cfitsio'
# optional makedepends: 'v4l-utils' 'python2'
# minimal depends: 'libxml2'
options=('!libtool')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e744a2c7d2060138369fa569baa7940fcd82c113fecc340e97bb92eb82b6104a')

build() {
  cd "$srcdir"/lib$pkgname-$pkgver
  
  ./autogen.sh
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "$srcdir"/lib$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # fix vipsprofile
  sed -i 's|^#!.*python$|&2|' "$pkgdir/usr/bin/vipsprofile"
}
