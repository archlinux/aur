# $Id$
# Maintainer: Ray Rashif <schiv@archlinux.org>

_basename=lv2
pkgname=lib32-${_basename}
pkgver=1.14.0
pkgrel=1
pkgdesc="Successor to the LADSPA audio plug-in standard"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('x86_64')
makedepends=('python2' 'lib32-libsndfile' 'lib32-gtk2')  #lib32-python should be more correct
optdepends=('libsndfile: Example sampler'
            'gtk2: Example sampler'
            'python2: Scripts')
provides=('lib32-lv2core')
conflicts=('lib32-lv2core')
replaces=('lib32-lv2core')
source=("http://lv2plug.in/spec/$_basename-$pkgver.tar.bz2")
md5sums=('0b56285a77aac3c93b50c36203aa91ee')

build() {
  cd "$srcdir/$_basename-$pkgver"
  export CC="$CC -m32"
  export CXX="$CXX -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  python2 waf configure --prefix=/usr --libdir=/usr/lib32
  python2 waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$_basename-$pkgver"
#REMOVE includes and others
  python2 waf install --destdir="$pkgdir"
  rm ${pkgdir}/usr/bin ${pkgdir}/usr/include ${pkgdir}/usr/share -Rf
}

# vim:set ts=2 sw=2 et:
 
