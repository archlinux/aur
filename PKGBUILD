# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-integer-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.5
pkgrel=1
epoch=
pkgdesc="Python functions for integer."
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
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('214884ad8ec7505a163686095575b2989ca23dff0398c16e25e2b2ccf265886b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
