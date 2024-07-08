# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=POT
pkgname=python-${_base,,}
pkgdesc="Python Optimal Transport Library"
pkgver=0.9.4
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
sha512sums=('102251b75dcf1ac673085dde2f5cb1512b512eee5d251b6ae2c63bf91340c94da9206380f99f3e7b302cd0f28a2577e6c573adea226beb06e825160d5e54ad0b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
