# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-concurrenttools
_name=${pkgname//-/_}
pkgver=0.0.5.1
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
sha256sums=('a0b93dd3a4fbe353f5850f095a90d10c034f53643e8590abfca1b1c7a75dddf6')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
