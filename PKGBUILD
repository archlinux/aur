# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-gmssl
pkgver=3.2.2
pkgrel=1
pkgdesc="Python crypto for sm2/sm3/sm4"
arch=('any')
url="https://github.com/py-gmssl/py-gmssl"
license=('BSD')
depends=('python' 'python-pycryptodomex')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer')
checkdepends=('python-pytest')
_tag='4072cbb917d6b36a06f1216d6f403f45d791edf8' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

check() {
  cd "${pkgname}"
  PYTHONPATH="${PWD}/build/lib" pytest
}
