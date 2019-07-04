# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
_date=20190624
_revision=59
pkgver=0.40.0.${_date}.${_revision}
pkgrel=1
pkgdesc='An utility to trace bitmaps: convert bitmaps to vector graphics'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'libmagick6')
makedepends=('intltool')
options=('!libtool')
source=("https://github.com/autotrace/autotrace/archive/travis-${_date}.${_revision}.tar.gz")
sha512sums=('ded8a0b7b0728b2a3315b40161e43327cee42b6d1e2210b0e0aac0418fd3b57dc60859c4d0aa00faee85a627edf38d1e40f0f6fa04c111ca51698fb5e0449b00')


build() {
  cd "$pkgname-travis-${_date}.${_revision}"
  autoreconf -ivf
  intltoolize --force
  aclocal
  PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig ./configure --prefix=/usr --with-pstoedit 
  make
}

package() {
  cd "$pkgname-travis-${_date}.${_revision}"
  make install DESTDIR="${pkgdir}"
}
