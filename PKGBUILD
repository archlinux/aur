# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=POT
pkgname=python-${_base,,}
pkgdesc="Python Optimal Transport Library"
pkgver=0.9.3
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
sha512sums=('dde414fc7eea66a351b2c4a69459850e1140d60a394a94a14375120fa4239c5496ff93f0ef461a5209004695c5d2b5efeb98256b3231bcf0e392a41751f14d19')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
