# Author: Samuel Fernando Mesa <samuelmesa at linuxmail dot org>

pkgname=qgis-crayfish-plugin
pkgver='2.7.0'
pkgrel=1
pkgdesc="Visualiser for temporal structured and unstructured grids in QGIS. "
arch=('i686' 'x86_64')
url="https://www.lutraconsulting.co.uk/products/crayfish/"
license=('GPL3')
depends=('qt4>=4.7' 'gdal' 'hdf5' 'netcdf' 'python2' 'python2-sip')
source=(https://github.com/lutraconsulting/${pkgname}/archive/release-${pkgver}.tar.gz)
md5sums=('ee80b1b33efc33b907d8f7f330771ef0')


prepare() {
  cd "${pkgname}-release-${pkgver}"

  # Change version of Python2
  sed -i s/python/python2/g install.py
}

build() {
  cd "${pkgname}-release-${pkgver}"

  qmake-qt4 PREFIX=/usr 

  make
}

package() {
  cd "${pkgname}-release-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/qgis/python/plugins/
  cp -dr --no-preserve=ownership crayfish "${pkgdir}/usr/share/qgis/python/plugins/"
}
