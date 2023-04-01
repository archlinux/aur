# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="A library for scientific machine learning"
pkgver=1.8.2
pkgrel=1
arch=(any)
url="https://github.com/lululxvi/${_base}"
license=(LGPL2)
depends=(python-scikit-optimize)
makedepends=(python-build python-installer python-setuptools python-wheel) # python-tensorflow-probability
optdepends=('python-tensorflow: TensorFlow backend support'
  'python-pytorch: backend: PyTorch backend support'
  'python-jax: JAX backend support'
  'python-paddlepaddle: PaddlePaddle backend support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c98667f3ef25fa23ac487f037d0ae988bc0d89f29c6d0486ce44ae0003f1880370b28325a1718f11102f304ab8fe0264d0e366978d8bc9fc76fc070fdbe7174')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
