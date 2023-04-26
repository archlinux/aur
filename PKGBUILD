# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-safetensors
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple, safe way to store and distribute tensors"
arch=('x86_64')
url="https://github.com/huggingface/safetensors"
license=('Apache')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools-rust')
optdepends=('python-jax'
            'python-flax'
            'python-jaxlib'
            'python-numpy'
            'python-paddlepaddle'
            'python-tensorflow'
            'python-pytorch')
checkdepends=('python-pytorch'
              'python-numpy'
              'python-tensorflow'
              'python-jax'
              'python-flax'
              'python-jaxlib'
              'python-black'
              'python-isort'
              'flake8'
              'python-click'
              'python-huggingface-hub'
              'python-pytest'
              'python-pytest-benchmark'
              'python-h5py')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('483f90f8a1377dbdcd0ac9488014474da2ff197a981cf41602758b002d87ce75fa68b221b94374501f108820ee59eeb70a53811b012150bcf224e880c6749b98')

build() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "safetensors-${pkgver}/bindings/python"
  pytest tests/
}

package() {
  cd "safetensors-${pkgver}/bindings/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
