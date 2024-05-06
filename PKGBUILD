# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-pprintpp
pkgver=0.4.0
pkgrel=6
pkgdesc="A drop-in replacement for pprint that's actually pretty"
arch=('any')
url="http://pypi.python.org/pypi/pprintpp"
license=('BSD')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://pypi.io/packages/source/p/${pkgname#python-}/${pkgname#python-}-${pkgver}.tar.gz")
b2sums=('8c892e0b36cd72b90d4ea3c120f9040298e28cb17135356aee6869256e82b53281d596f816ca3ab3580589f53926d60a5cebd0174a8b83240d1abdb2f7a7bbb0')

prepare() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  sed -i 's?\(\"README.rst\"\), \"U\"?\1?' setup.py
}

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
