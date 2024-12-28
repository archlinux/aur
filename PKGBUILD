# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-rodi
_name=${pkgname#python-}
pkgver=2.0.6
pkgrel=2
epoch=
pkgdesc="Implementation of dependency injection for Python 3"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-isort
    python-typing_extensions
)
makedepends=(
    flake8
    mypy
    python-black
    python-flake8-black
    python-build
    python-hatchling
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=(
    python-pytest
    python-pytest-asyncio
    python-pytest-cov
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('f533e315d84b63824efcc67526a156ad5fb0a158f1ccbc41e0db3944d0c08693')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
