# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=json-repair
pkgname=python-${_name}
pkgver=0.61.1
pkgrel=1
pkgdesc="A package to repair broken JSON strings"
arch=('any')
url="https://github.com/mangiucugna/json_repair"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('24a68de2891c696ad3bd9a94874e8d3ef2d309c56af2973094b8297c975b5b58')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "import json_repair; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
