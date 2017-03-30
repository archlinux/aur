# Maintainer: Kirek <rbuldo at gmail dot com>
pkgname=python-langtable
_pyname=langtable
pkgver=0.0.37
pkgrel=1
pkgdesc='Guessing reasonable defaults for locale, keyboard layout, territory, and language.'
arch=('any')
url='https://github.com/mike-fabian/langtable'
license=('GPLv3+' 'MIT')
depends=('python' 'python-setuptools' 'gzip')
options=(!emptydirs)
source=("https://github.com/mike-fabian/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('12999a70d5954a730a09886c17c210354b538bd22ddcfe5b1367207724a84071')

_destdir=/usr
_datadir=${_destdir}/share/langtable
  
build () {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --prefix="${_destdir}"  --root="${pkgdir}" --install-data="${_datadir}" --optimize=1 --skip-build
  gzip --force --best ${pkgdir}/${_datadir}/*.xml
}
