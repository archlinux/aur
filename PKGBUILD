# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=24.12
pkgrel=1
pkgdesc='Naive XML bindings for python'
url='https://xsdata.readthedocs.io'
checkdepends=(python-pytest python-pytest-benchmark ruff)
depends=(
    python
    python-click
    python-click-default-group
    python-docformatter
    python-jinja
    python-lxml
    python-requests
    python-toposort
    python-typing_extensions
)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(ruff)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('67c16c032bbde82c064f6c28cdf6b4f8adcbd0498e2668a346ff8e52a3a200b4')

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

