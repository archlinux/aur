# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-concurrenttools
_name=${pkgname//-/_}
pkgver=0.1.4
pkgrel=1
epoch=
pkgdesc="Python concurrent tools."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-argtools
    python-asynctools
    python-decotools
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
sha256sums=('2b301913c27f3410609fd6a2aa32c3fd0ce5d033fa3b0be152383c4653f0be8b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
