# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xeus-python-shell
pkgname=python-${_base}
pkgdesc="The xeus-python core python logic"
pkgver=0.6.2
pkgrel=1
arch=(any)
url="https://github.com/jupyter-xeus/${_base}"
license=(BSD-3-Clause)
depends=(python-debugpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('ipython: '
  'python-pyjs: ')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1d8f151951bdfaa982d0bf0ed2a4ad836c7f13f9ac3c34ba747c1ff15514e3a428f40cb140012ab9d5efbdcc2a10e01e287d318cde165fe05c655f356804282f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
