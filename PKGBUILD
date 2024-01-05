# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=24.1
pkgrel=1
pkgdesc='Naive XML bindings for python'
url='https://xsdata.readthedocs.io'
checkdepends=(python-pytest python-pytest-benchmark)
depends=(
    python
    python-click
    python-click-default-group
    python-docformatter
    python-jinja
    python-lxml
    python-requests
    python-toposort
    python-typing-extensions
)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e36fc8b4624bbbaf2d34d0857c6d78ede99ec1d3240cc7dd50546177fbb52442')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

check() {
  cd "$_pkgname-$pkgver"
  pytest tests/
}

