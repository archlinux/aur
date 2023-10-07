# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-trogon
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
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
    python-textual
    python-black
)
makedepends=(python-build
    python-installer
    python-wheel
    python-validate-pyproject
    python-setuptools)
checkdepends=(python-pytest
    python-pytest-mypy)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('61a57f0f1a38227d90601cd020f46960be8e36947b5e56c6932c2e01ecc5042a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
