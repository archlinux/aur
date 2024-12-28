# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-essentials
_name=${pkgname#python-}
pkgver=1.1.5
pkgrel=1
epoch=
pkgdesc="General purpose classes and functions, reusable in any kind of Python application"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
)
makedepends=(
    flake8
    mypy
    python-black
    python-flake8-black
    python-hatchling
    python-typing_extensions
    python-build
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
sha256sums=('8736f738bb2c51d5069b2de2cf9146f7d402f25f9f95636781e59a422c908c46')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
