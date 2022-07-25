# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

_pkgname=autotrace
pkgname="${_pkgname}-git"
pkgver=20200219.65.r0.g4333e37
pkgrel=3
pkgdesc='An utility to trace bitmaps: convert bitmaps to vector graphics, with patches from Sacha Chua'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'graphicsmagick')
makedepends=('intltool' 'git' 'autoconf' 'automake')
provides=(autotrace)
conflicts=(autotrace)
options=('!libtool')
source=("${_pkgname}::git+https://github.com/sachac/autotrace.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^travis.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  autoreconf -ivf
  intltoolize --force
  aclocal
  ./configure --prefix=/usr --with-pstoedit --with-magick=GraphicsMagick --with-png
  make
}

package() {
  cd "$_pkgname"
  make install DESTDIR="${pkgdir}"
}
