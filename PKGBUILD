# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="Library for scientific machine learning"
pkgver=1.14.0
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
sha512sums=('63136bf3cde5fba4599d6fc12cd486642fbfd610e526c4e0d4f46b8cbcd8f57ebadb1627af999a8facef52eef69ad0d9499182382ee820ef2912c34a0f88158b')

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
