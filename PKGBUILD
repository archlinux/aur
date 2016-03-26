# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=vips
pkgver=8.2.3
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.vips.ecs.soton.ac.uk/index.php"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif')
optdepends=('python2: vipsprofile')
# less used depends: 'libwebp' 'cfitsio'
# optional makedepends: 'v4l-utils' 'python2'
# minimal depends: 'libxml2'
options=('!libtool')
source=("http://www.vips.ecs.soton.ac.uk/supported/${pkgver%.*}/$pkgname-$pkgver.tar.gz")
md5sums=('4d0eac8cd62e16160b0bef5e61c94797')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # fix vipsprofile
  sed -i 's|^#!.*python$|&2|' "$pkgdir/usr/bin/vipsprofile"
}

