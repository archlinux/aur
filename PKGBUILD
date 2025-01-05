# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115tiny302
_name=${pkgname#python-}
pkgver=0.0.9
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
    python-yaml
    uvicorn
    #AUR
    python-cachedict
    python-blacksheep
    python-p115client
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
sha256sums=('fbc160265814c3c4e02b4b12ffe41e8ee16653a62ba75c2498c8c3a4fa176cb5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
