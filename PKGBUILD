# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115nano302
_name=${pkgname#python-}
pkgver=0.0.7.3
pkgrel=1
epoch=
pkgdesc="115 nano 302 backend."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-orjson
    python-yaml
    uvicorn
    #AUR
    python-blacksheep
    python-cachedict
    python-p115cipher
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
sha256sums=('30ddfa0719b4cca98948b8bf51f781d2651f843c14f9a315efa22b10201f0412')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
