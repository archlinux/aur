# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=python-flifile
_name=flifile
pkgver=1.4.2
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

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b07f0ae7a8e758a14ab519e34894f3f199c2e48af0a3e9e161c7841150716489d34be96ff16bb50a88b56f9a7c69e3ab3a385073dee438b1133174e9fe4ae340')

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
