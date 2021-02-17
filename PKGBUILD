# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
_date=20200219
_revision=65
pkgver=20200219.65.2.g16136eb
pkgrel=1
pkgdesc='An utility to trace bitmaps: convert bitmaps to vector graphics, with patches from Sacha Chua'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'graphicsmagick')
makedepends=('intltool' 'git')
options=('!libtool')
source=("git+https://github.com/sachac/autotrace.git#commit=16136eb504794f9af389a5f4ac7339d3bf4b9a66")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's+travis.++' | tr - .
}

build() {
  cd "$pkgname"
  autoreconf -ivf
  intltoolize --force
  aclocal
  ./configure --prefix=/usr --with-pstoedit --with-graphicsmagick
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="${pkgdir}"
}
