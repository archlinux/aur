# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-sentencepiece
pkgver=0.1.98
pkgrel=2
pkgdesc="SentencePiece python wrapper"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache')
depends=('python' 'python-protobuf')
makedepends=('git'
             'cmake'
             'python-setuptools'
             'python-wheel'
             'python-installer')
# checkdepends=('python-pytest')
_tag='518c57c335534d495d40d95d70199e28b4c8ce2a' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}/python"
  python setup.py bdist_wheel
}

# check() {
#   cd "${pkgname}/python"
#   local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#   PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest test/
# }

package() {
  cd "${pkgname}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
