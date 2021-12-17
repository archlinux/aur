# Contributor: Stéphane Gaudreault <stephane@archlinux.org>, Graziano Giuliani <graziano.giuliani@gmail.com>
# Maintainer : Austin Cross <austincross@gmail.com>
pkgname=python-pygrib
pkgver=2.1.4
pkgrel=2
pkgdesc="Python module for reading and writing GRIB (editions 1 and 2) files."
arch=('i686' 'x86_64')
url="https://github.com/jswhit/pygrib"
license=('MIT')
depends=('python-pyproj' 'jasper' 'python-numpy' 'eccodes')
source=(https://pypi.python.org/packages/source/p/pygrib/pygrib-${pkgver}.tar.gz setup.cfg)
md5sums=('5ec833c847edca642a55545ad046669f'
        'd5a6f196213d2a53c280c7be1cb1bb03')

build() {
  cd "${srcdir}/pygrib-${pkgver}"

   export JASPER_DIR=/usr
   export PNG_DIR=/usr
   export ZLIB_DIR=/usr
   export OPENJPEG_DIR=/usr
   export GRIBAPI_DIR=/usr
   cp ${srcdir}/setup.cfg .
   python setup.py build
}

package() {
   cd "${srcdir}/pygrib-${pkgver}"
   python setup.py install --prefix=/usr \
     --root="${pkgdir}" --skip-build --optimize=1
   install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
   install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
   rm -fr ${pkgdir}/usr/bin
}
