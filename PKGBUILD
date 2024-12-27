# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-integer-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.2.1
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
sha256sums=('a87be9b9e0e97ea26a3a21378ece1f1ab8ac6d6df4eec218dfe7d38159218522')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
