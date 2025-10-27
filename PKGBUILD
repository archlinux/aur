# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115open302
_name=${pkgname#python-}
pkgver=0.0.5.3
pkgrel=1
epoch=
pkgdesc="115 open 302 backend."
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
    python-blacksheep-rich-log
    python-cachedict
    python-dicttools
    python-p115cient
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
sha256sums=('b08ca18eb93f3941f183221667d43b3f4f1c52c7d1429be8bd4a0507c1488dea')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
