# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-essentials
_name=${pkgname#python-}
pkgver=1.1.9
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
    python-pydantic
    python-black
    python-flake8-black
    python-isort
    python-typing_extensions
    python-hatchling
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
sha256sums=('7fbea3a518cbeafe5374fb7e2ea2c15a109e8a7fd1eaab62ae87cbd1b3b1e8d0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dvm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
