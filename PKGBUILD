# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-safetensors
pkgver=0.2.8
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
optdepends=('python-jax: for safetensors.flax'
            'python-numpy: for safetensors.numpy'
            'python-tensorflow: for safetensors.tensorflow'
            'python-pytorch: for safetensors.torch')
checkdepends=('python-pytorch'
              'python-numpy'
              'python-tensorflow'
              'python-jax'
              'python-flax'
              'python-black'
              'python-isort'
              'flake8'
              'python-click'
              'python-huggingface-hub'
              'python-pytest'
              'python-pytest-benchmark')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2cfd2ae63c9aafd1832827685fbc7b53af9bfb09035e61f8fed639f221fd1d057e4189adc58f027dd1565db4e83492b5c16c449be9863c8a28a861f9524dc654')

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
