# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-sentencepiece
pkgver=0.1.98
pkgrel=1
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=('any')
url="https://github.com/google/sentencepiece"
license=('Apache')
depends=('python')
makedepends=('git'
             'cmake'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest')
_tag='518c57c335534d495d40d95d70199e28b4c8ce2a' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}/python"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}/python"
  pytest test/
}

package() {
  cd "${pkgname}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
