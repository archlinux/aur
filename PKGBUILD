# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="A library for scientific machine learning"
pkgver=1.8.3
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
sha512sums=('5146154942fa3c4548665ae38b3c26aacd1661de5fa0aa3856d4676fe87978a49a85e3ff3c5636d73c62be0dd3a76ebbfa473a4a5c5da2aad24991f001a62833')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
