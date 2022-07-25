# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

_pkgname=autotrace
pkgname="${_pkgname}-git"
pkgver=20200219.65.r121.gfcd9043
pkgrel=2
pkgdesc='AutoTrace is a utility for converting bitmap into vector graphics.'
arch=('i686' 'x86_64')
url='https://github.com/autotrace/autotrace.git'
license=('GPL' 'LGPL')
depends=('libpng' 'pstoedit' 'graphicsmagick' 'glib2')
makedepends=('intltool' 'git' 'autoconf' 'automake')
provides=(autotrace)
options=('!libtool')
source=("${_pkgname}::git+https://github.com/autotrace/autotrace.git#branch=master")
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
