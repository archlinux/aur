# Maintainer: Kirek <rbuldo at gmail dot com>
pkgname=python-langtable
_pyname=langtable
pkgver=0.0.33
pkgrel=1
pkgdesc='Guessing reasonable defaults for locale, keyboard layout, territory, and language.'
arch=('any')
url='https://github.com/mike-fabian/langtable'
license=('GPLv3+' 'MIT')
depends=('python' 'python-setuptools' 'gzip')
options=(!emptydirs)
source=("https://github.com/mike-fabian/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('26c9a5891c3a92995b49bfc3e32d87b66eb089dd30e1c7cda4aa44347196b363')

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
