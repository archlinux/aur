# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgname=python-pytlv
_pyname=${pkgname#python-}
pkgver=0.71
pkgrel=3
pkgdesc='TLV(tag length value) data parser, especially useful for EMV tags parsing'
arch=('any')
url='https://github.com/timgabets/pytlv'
license=('LGPL-2.0-only')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/bf/fb/05cb227d725bae7fce250c5b4706442d74e94e3f5faa655efd4621ed559c/${_pyname}-${pkgver}.tar.gz")
sha256sums=('6edc59d284339f5669c178a11e583a09db8b87c9e47ab2d5ed2a05c97cc98d56')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  mv pytlv/tests.py ./tests.py
  sed -i 's/from TLV import/from pytlv.TLV import/' tests.py
}

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python -m unittest
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
