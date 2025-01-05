# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="Library for scientific machine learning"
pkgver=1.13.1
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
sha512sums=('ee3024b42a0a69e779b58582bdafc2acc7bfca1cb60a594b7bc23ab916393c15030ab9d397043fd43602229ed0ba702903c53b9a983e230689aa9c20df227bf3')

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
