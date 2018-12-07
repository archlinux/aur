# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=vips-8.6.5
pkgver=8.6.5
pkgrel=1
pkgdesc="A free image processing system - version 8.6.5"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://libvips.github.io/libvips/"
depends=('libxml2' 'fftw' 'imagemagick' 'orc' 'openexr' 'pango' 'libexif')
optdepends=('python2: vipsprofile')
options=('!libtool')
source=("https://github.com/jcupitt/${pkgname%-*}/archive/v${pkgver}.tar.gz")
sha256sums=('a9be247e7ae1230eca72cf1b354a423604ced62ab05a0627fdc1068843aadc71')
provides=('vips')
conflicts=('vips')

build() {
  cd "$srcdir"
  mv lib$pkgname $pkgname-$pkgver
  cd "$srcdir"/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
