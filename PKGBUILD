# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-essentials-openapi
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="Classes to generate OpenAPI Documentation v3 and v2, in JSON and YAML."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-click
    python-httpx
    python-jinja
    python-markupsafe
    python-yaml
    python-rich
    #AUR
    python-essentials
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
sha256sums=('416395ac85559437b594fbc9b0cb66d50a26615b0fd8ba0058431076f2fcbfa5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
