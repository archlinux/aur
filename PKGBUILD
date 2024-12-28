# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep
_name=${pkgname#python-}
pkgver=2.0.7
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
    python
    python-certifi
    python-charset-normalizer
    python-dateutil
    python-httptools
    python-itsdangerous
    #AUR
    python-essentials
    python-essentials-openapi
    python-guardpost
    python-rodi
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('ae192809c1e42de5a0d6230f1238d027641a8d889a4a9fb5349b7980f74afd88')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
