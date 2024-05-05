# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepxde
pkgname=python-${_base}
pkgdesc="Library for scientific machine learning"
pkgver=1.11.1
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
sha512sums=('67e26d10ffd66b0acbc91a6203e76b479c2468e5a0ce4dd42911babd97a9590426a49bf3f852ee3b6baa701489d757570a0152f7032df5104d35f9e7e88cb752')

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
