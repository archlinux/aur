# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115nano302
_name=${pkgname#python-}
pkgver=0.1.3.1
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
    python-blacksheep-client-request
    python-blacksheep-rich-log
    python-cachedict
    python-dicttools
    python-p115rsacipher
    python-p115pickcode
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('deae0081252369aa0ed43730401979c1f72337c6fdd150b91ef734b08f15f845')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
