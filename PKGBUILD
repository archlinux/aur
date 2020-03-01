# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
_date=20200219
_revision=65
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
sha512sums=('a431168a2da231436f9cf301c6d286a9104f5ad0e8053047539b4784522d2982100afe823d6c3e6492adc84d83fcd3196cee91dec6728c99647800d9dc383a4d')


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
