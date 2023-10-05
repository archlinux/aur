# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Radek Podgorny <radek@podgorny.cz>
_base=blitzdb
pkgname=python-${_base}
pkgdesc="A document-oriented database written purely in Python"
pkgver=0.4.4
pkgrel=1
arch=(any)
url="https://github.com/adewes/${_base}"
license=(MIT)
depends=(python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-faker python-sqlalchemy)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('0ca22113f52f36d0fd8e55de8b26582edb10e19aae10a79ecb89ed852566f0fd5ba73a02608920a0f65e990f026d367834c4ac0d1e71f546cad8c14f7377d576')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
}
