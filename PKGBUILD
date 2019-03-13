# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
_date=20190108
_revision=39
pkgver=0.40.0.${_date}.${_revision}
pkgrel=3
pkgdesc='An utility to trace bitmaps: convert bitmaps to vector graphics'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit')
makedepends=('intltool' 'libmagick6')
options=('!libtool')
source=("https://github.com/autotrace/autotrace/archive/travis-${_date}.${_revision}.tar.gz")
sha512sums=('e911763d77e04334e85b9467de98e4a41437c55ec14711ce5bb1ef839f981547b8b3e477274cbf40f615b2ffffc7a8e8d2c860b52f214fb49d2d33636140c443')

build() {
  cd "$pkgname-travis-${_date}.${_revision}"
  autoreconf -ivf
  intltoolize --force
  aclocal
  ./configure --prefix=/usr --with-pstoedit --with-magick=/usr/include/ImageMagick-6
  make
}

package() {
  cd "$pkgname-travis-${_date}.${_revision}"
  make install DESTDIR="${pkgdir}"
}
