# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-sentencepiece
pkgver=0.2.0
pkgrel=1
pkgdesc="SentencePiece python wrapper"
arch=('x86_64')
url="https://github.com/google/sentencepiece"
license=('Apache-2.0')
depends=('python' 'python-protobuf')
makedepends=('git'
             'cmake'
             'python-setuptools'
             'python-wheel'
             'python-installer')
# checkdepends=('python-pytest')
_tag='17d7580d6407802f85855d2cc9190634e2c95624' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
  git -C "${pkgname}" clean -dfx
}

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
