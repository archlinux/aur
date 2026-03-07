# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-essentials-openapi
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.0
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
sha256sums=('578c81501ccf6d18c0839d60636214fbd051f0ef37f1d207d4e3c92de2aac008')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
