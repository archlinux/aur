# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-trogon
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=2
epoch=
pkgdesc="Automatically generate a Textual TUI for your Click CLI"
arch=('any')
url="https://pypi.org/project/trogon"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
    python-click
    python-rich
    python-textual
)
makedepends=(
    python-black
    python-build
    python-installer
    python-wheel
    python-validate-pyproject
    python-setuptools
    python-poetry-core)
checkdepends=(python-pytest
    python-pytest-mypy)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('fd1abfeb7b15d79d6e6cfc9e724aad2a2728812e4713a744d975f133e7ec73a4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
