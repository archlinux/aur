# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=23.8
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
sha256sums=('55f03d4c88236f047266affe550ba0dd19476adfce6a01f3e0aefac7c8078e56')

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

