# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep
_name=${pkgname#python-}
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc="Fast web framework for Python asyncio"
arch=($CARCH)
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    glibc
    python
    python-setuptools
    python-certifi
    python-dateutil
    python-httptools
    python-itsdangerous
    python-jinja
    python-pydantic
    python-pyjwt
    #AUR
    python-essentials
    python-essentials-openapi
    python-guardpost
    python-rodi
)
makedepends=(
    cython
    flake8
    mypy
    python-black
    python-flake8-black
    python-hatchling
    python-build
    python-installer
    python-wheel
    #     python-setuptools
)
checkdepends=(
    python-pytest
    python-pytest-asyncio
    python-pytest-cov
)
optdepends=()
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('371986575e55a447b1c721d185e578b1d097d0bdddc1f9563ee8c25e3c8e05e4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    cython blacksheep/url.pyx
    cython blacksheep/exceptions.pyx
    cython blacksheep/headers.pyx
    cython blacksheep/cookies.pyx
    cython blacksheep/contents.pyx
    cython blacksheep/messages.pyx
    cython blacksheep/scribe.pyx
    cython blacksheep/baseapp.pyx
    python setup.py build_ext --inplace

    #     make buildext
    #     make annotate
    #     make build
    python -m build --wheel --no-isolation

}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
