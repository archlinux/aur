# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Leo Mao <leomaoyw at gmail dot com>
_base=POT
pkgname=python-${_base,,}
pkgdesc="Python Optimal Transport Library"
pkgver=0.9.2
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
sha512sums=('fb8b4bda98418742c810b0f0133850766d0fd624ce9c79cd5ea1ff44a9a87d41b66392be69913879c83abfeaa4a7f2f683411e6cec5e91daa1256d57278fb6cd')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
