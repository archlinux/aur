# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-essentials
_name=${pkgname#python-}
pkgver=1.1.6
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
    python-isort
    python-typing_extensions
)
makedepends=(
    flake8
    mypy
    python-pydantic
    python-black
    python-flake8-black
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
sha256sums=('3fd26923f5f2ece51a219dbb17b1fb22c9190d70fa2104919be92a6419521877')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dvm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
