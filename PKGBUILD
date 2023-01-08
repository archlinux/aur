# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-safetensors
pkgver=0.2.7
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
sha512sums=('a3ddacb281cdd7c4fafaef3e64017200545b996c50be182b41d48b63d61fb392feb91f15dc221318affb88d7f4701dbb7730d6f28bc11a361514292fe290eaac')

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
