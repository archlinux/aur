# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="A library for scientific machine learning"
pkgver=1.9.2
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
sha512sums=('3af2dc0fc216554e80a938900c66f589c9aaff0fc56f16ea363ef9103c3e8d629bd3688151a939c7bfb95885e95df947e7af7663c0accbd968a503d093c27c4b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
