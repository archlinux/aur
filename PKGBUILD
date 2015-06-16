# Contributor: Sphax <zecmerquise at gmail dot com>
# Contributor: WAAAGH.313ph4n7 <waaagh313ph4n7@gmail.com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gtkglext
pkgname=lib32-$_pkgbase
pkgver=1.2.0
pkgrel=9
pkgdesc="OpenGL extensions for GTK+ (32-bit)"
arch=('x86_64')
url="http://gtkglext.sourceforge.net/"
license=('LGPL')
depends=('lib32-gtk2' 'lib32-libxmu' 'lib32-glu' 'lib32-pangox-compat' "$_pkgbase")
makedepends=('gcc-multilib' 'lib32-mesa')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/gtkglext/${_pkgbase}-${pkgver}.tar.bz2"
        gtk2.20.patch)
md5sums=('ed7ba24ce06a8630c07f2d0ee5f04ab4'
         'e5a87ec3f2d0e616c6f32f90c3f7237f')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
 
  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i ../gtk2.20.patch
  autoconf --force
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}
 
package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{include,share}
}

# vim:set ts=2 sw=2 et:
