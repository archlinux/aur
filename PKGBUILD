# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=POT
pkgname=python-${_base,,}
pkgdesc="Python Optimal Transport Library"
pkgver=0.9.6
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
sha512sums=('092ab87ae19bb2701f429c7a534a7aaa24bdad7345f3c83b06eae02994f3fc891295a6e284642a6adf187691dc2bbca28cdc75581ba2c521736910da3f2e3419')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
