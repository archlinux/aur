# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-iter-collect
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc="Python iter_collect."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
)
makedepends=(
    python-poetry
    python-poetry-core
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('aacd52ba3a381df1e5ca9b78be98bd7130cb898ef9c62ed7490cb3ee322ca11b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
