# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115tiny302
_name=${pkgname#python-}
pkgver=0.2.3.1
pkgrel=1
epoch=
pkgdesc="115 tiny 302 backend."
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
    python-cachedict
    python-blacksheep
    python-blacksheep-rich-log
    python-dicttools
    python-p115client
    python-p115pickcode
    python-posixpatht
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
sha256sums=('cbe4c34ccb0f430c24f254482085e3157f00df00ba676bd0529fa243b768a4b4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
