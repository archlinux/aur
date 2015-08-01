# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
_pkgname=mapslicer
pkgname=${_pkgname}-git
pkgver=1.0.rc1.r14.g053ff10
pkgrel=1
epoch=0
pkgdesc="a graphical application for online map publishing"
arch=('any')
url="https://wiki.osgeo.org/wiki/MapSlicer"
license=('BSD')
groups=()
depends=('gdal' 'python2' 'wxpython2.8')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/geopython/${_pkgname}.git")
noextract=()
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${pkgname}
  grep -rl '^#!/usr/bin/env python$' ${srcdir} | xargs sed -i 's/^\#\!\/usr\/bin\/env\ python$/\#\!\/usr\/bin\/env\ python2/g'
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/lib/mapslicer
  cp mapslicer.py ${pkgdir}/usr/lib/mapslicer
  cp -r mapslicer ${pkgdir}/usr/lib/mapslicer

  mkdir -p ${pkgdir}/usr/bin
  cd $pkgdir/usr/bin/
  ln -s ../lib/mapslicer/mapslicer.py mapslicer
  #chmod a+x $(CURDIR)/debian/mapslicer/usr/bin/mapslicer
  cd -

  mkdir -p ${pkgdir}/usr/share/mapslicer
  cp -r resources/* ${pkgdir}/usr/share/mapslicer

  mkdir -p ${pkgdir}/usr/share/applications
  cp deploy/linux/mapslicer.desktop ${pkgdir}/usr/share/applications

  mkdir -p ${pkgdir}/usr/share/doc/mapslicer
  cp README.txt ${pkgdir}/usr/share/doc/mapslicer
}

# vim:set ts=2 sw=2 et:
