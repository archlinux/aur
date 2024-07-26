# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="Library for scientific machine learning"
pkgver=1.12.0
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
sha512sums=('215cb6d898ee7edbbabf69d34b521cd227fb1796d542a7223440f034f9b6142f2625190ae70c12731772ad27ab313b9ae567617d0cfaf39cdbbe92ab7f1c53f2')

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
