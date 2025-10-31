# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-flifile
_name=flifile
pkgver=1.4.4
pkgrel=1
pkgdesc="Python code for opening a lambert instruments .fli file"
arch=('any')
url="https://github.com/rharkes/flifile"
license=('GPL-3.0-only')
depends=('python-numpy')
optdepends=(
    'python-black'
    'python-pytest'
    'mypy'
    'twine'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-pytest'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9a90af2911db1743eb48d925d6b4397a25da8c20855761ab8adf288838ff07f7513805dab4b1752115767b803ad34f0b42e10381b5744e0b2bcd79d7f70add44')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  python -m pytest flifile tests
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
