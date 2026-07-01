# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Tobias Baust <tobias.baust at tutanota dot com>
_base=pyfoam
pkgname=python-${_base,,}
pkgver=2026.6
pkgrel=1
pkgdesc="Python Utilities for OpenFOAM"
arch=(any)
url="https://openfoamwiki.net/index.php/Contrib/PyFoam"
license=(GPL-2.0-or-later)
depends=(python-numpy python-jinja)
makedepends=(python-build python-installer python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6ea6caa74d24b4d4ed1cdcd58514043687fff9460a182760199ae7df49abb564ae0c0fe6db9f84857556e648032fd06c1557c961edfde20c75e69dcc41771410')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
