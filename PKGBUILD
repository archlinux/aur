# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="A library for scientific machine learning"
pkgver=1.8.4
pkgrel=1
arch=(any)
url="https://github.com/lululxvi/${_base}"
license=(LGPL2)
depends=(python-scikit-optimize)
makedepends=(python-build python-installer python-setuptools python-wheel) # setuptools_scm[toml] | python-tensorflow-probability
optdepends=('python-tensorflow: TensorFlow backend support'
  'python-pytorch: backend: PyTorch backend support'
  'python-jax: JAX backend support'
  'python-paddlepaddle: PaddlePaddle backend support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7adf3c59589ac39e626b50031031e628d87aed9a38189729d704e20e429d721d0ffa61d709222ca7f165b591dea7d255481d412c42d641b34ff38bb9725de0ff')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
