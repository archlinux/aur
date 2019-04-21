# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
_date=20190409
_revision=48
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
sha512sums=('760422b7eb9c5ee3e33eb3d6dbf25a4d8a0890f015661f75dec5764377aadb67e0bdcf7e988a41c39614d3f550d7cdf56c1414e0ac5e074a65d6b746fce2d732')

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
