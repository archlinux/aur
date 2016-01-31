# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Maintainer : Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=python2-pygrib
pkgver=2.0.1
pkgrel=1
pkgdesc="Python module for reading and writing GRIB (editions 1 and 2) files."
arch=('i686' 'x86_64')
url="https://github.com/jswhit/pygrib"
license=('MIT')
depends=('python2-pyproj' 'jasper' 'python2-numpy' 'grib_api')
source=(https://pypi.python.org/packages/source/p/pygrib/pygrib-${pkgver}.tar.gz)
md5sums=('e9ae04cb987992691b388b16be53214a')

build() {
  cd "${srcdir}/pygrib-${pkgver}"
  export JASPER_DIR=/usr
  export PNG_DIR=/usr
  export ZLIB_DIR=/usr
  export OPENJPEG_DIR=/usr
  export GRIBAPI_DIR=/usr
  python2 setup.py build 
}

package() {
 cd "${srcdir}/pygrib-${pkgver}"
 python2 setup.py install --prefix=/usr \
   --root="${pkgdir}" --skip-build --optimize=1
 install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
 install -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/
 rm -fr ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
