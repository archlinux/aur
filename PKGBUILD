# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="A library for scientific machine learning"
pkgver=1.10.1
pkgrel=1
arch=(any)
url="https://github.com/lululxvi/${_base}"
license=(LGPL2)
depends=(python-scikit-optimize)
makedepends=(python-build python-installer python-setuptools-scm python-wheel) # python-tensorflow-probability
optdepends=('python-tensorflow: TensorFlow backend support'
  'python-pytorch: backend: PyTorch backend support'
  'python-jax: JAX backend support'
  'python-paddlepaddle: PaddlePaddle backend support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('749fe9bae0970d290c779b697cfd2c17f4041ab28d98e930020fb8f2b51e8d664934f8d2e22b95bd2cdf322985f16aab953283c95088e0e06f15873947d56105')

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
