# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=pocketbase
pkgname=python-${_name}
pkgver=0.17.3
pkgrel=1
pkgdesc="PocketBase SDK for Python"
arch=('any')
url="https://github.com/vaphes/pocketbase"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('11de4d412fddc98e72030fa78b395972eaa646c36c06aa2506d8a26cd251cb00')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv test-env
  test-env/bin/pip install installer dist/*.whl --quiet
  test-env/bin/python -c "from pocketbase import PocketBase; print('import OK')"
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
