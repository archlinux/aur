# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115tiny302
_name=${pkgname#python-}
pkgver=0.2.2
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
sha256sums=('0d53df4ea76e21410d7d9a8d4fb30d6fa48ff66b96ba803f475c39c672bf12e2')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
