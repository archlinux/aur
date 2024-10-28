# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="Library for scientific machine learning"
pkgver=1.12.2
pkgrel=1
arch=(any)
url="https://github.com/lululxvi/${_base}"
license=(LGPL-2.1-or-later)
depends=(python-scikit-optimize)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
optdepends=('python-tensorflow-probability: TensorFlow backend support'
  'python-pytorch: backend: PyTorch backend support'
  'python-flax: JAX backend support'
  'python-paddlepaddle: PaddlePaddle backend support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('62a05b1d2ab1d759e2c30dc50420ede4577b7a032e4bfc1e7d66d048ccc011ce27381acb19d89ab1608bea40e8c452693deb41dc8790d0d4aaa168ee4f13d029')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
