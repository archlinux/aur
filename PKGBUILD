# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=23.6
pkgrel=1
pkgdesc='Naive XML bindings for python'
url='https://xsdata.readthedocs.io'
checkdepends=('python-click-default-group' 'python-docformatter' 'python-pytest' 'python-pytest-benchmark' 'python-toposort' 'python-untokenize')
depends=('python')
makedepends=(python-build python-installer python-wheel)
optdepends=('python-click'
    'python-toposort')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('695a38de23d270a772d803e260c17eef65d98354884a955e30f08075c0f574a8')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "$_pkgname-$pkgver"
  pytest tests/
}

