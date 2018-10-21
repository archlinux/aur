# Author: Samuel Fernando Mesa <samuelmesa at linuxmail dot org>

pkgname=qgis2-crayfish-plugin
_pkgname=qgis-crayfish-plugin
pkgver='2.7.2'
pkgrel=1
pkgdesc="Visualiser for temporal structured and unstructured grids in QGIS  2.x. "
arch=('i686' 'x86_64')
url="https://www.lutraconsulting.co.uk/products/crayfish/"
license=('GPL3')
depends=('qgis-ltr' 'gdal' 'hdf5' 'netcdf' 'python2' 'python2-sip')
source=(https://github.com/lutraconsulting/${_pkgname}/archive/release-${pkgver}.tar.gz)
md5sums=('8c57feba4da7471ee941c9aaec9fef80')

prepare() {
  cd "${_pkgname}-release-${pkgver}"

  # Change version of Python2
  sed -i s/python/python2/g install.py
}

build() {
  cd "${_pkgname}-release-${pkgver}"

  qmake-qt4 PREFIX=/usr 

  make
}

package() {
  cd "${_pkgname}-release-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/qgis/python/plugins/
  mkdir -p ${pkgdir}/usr/lib/
  cp -dr --no-preserve=ownership crayfish "${pkgdir}/usr/share/qgis/python/plugins/"
  cp --no-preserve=ownership crayfish/*.so* "${pkgdir}/usr/lib/"
}
