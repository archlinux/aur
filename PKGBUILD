# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115nano302
_name=${pkgname#python-}
pkgver=0.0.8
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
sha256sums=('cb023281cc4dfdd3c22ba46f77b118205beb1d9865d82eb2ac3531d12b971924')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
