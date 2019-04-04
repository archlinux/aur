# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
_date=20190329
_revision=42
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
sha512sums=('1ae3b61cba76629d15ed4389928a7a2bfb7f3db3b01ab3be47a50396e513b96ab2c30ea8cdcfa865fdd149507c246aaa345dd0b8509cec48372e6411513286d2')

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
