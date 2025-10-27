# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115tiny302
_name=${pkgname#python-}
pkgver=0.2.2.1
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
sha256sums=('2a77fdee368538fe4231194b316ea282003536ff0c1c057d0f98c84ca810faca')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
