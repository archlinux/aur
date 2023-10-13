# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=POT
pkgname=python-${_base,,}
pkgdesc="Python Optimal Transport Library"
pkgver=0.9.1
pkgrel=1
arch=(x86_64)
url="https://github.com/PythonOT/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
optdepends=('python-autograd: necessary to use `ot.dr`'
  'python-cupy: necessary to use `ot.gpu`'
  'python-jax: necessary to use `ot.lp`'
  'python-tensorflow: necessary to use `ot.lp`'
  'python-pymanopt: necessary to use `ot.dr`')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('2f795a9c9a7f11b82ca99515aa4cbe77ae2c95777c94827a1774fcd0c9b9d3453c9e367c3788b5fa854cd6a889dbdd1c2304dafc5eab540d4980b606bad99312')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
