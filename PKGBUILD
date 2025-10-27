# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep-rich-log
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="BlackSheep access log middleware."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-rich
    python-orjson
    # AUR
    python-blacksheep
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
sha256sums=('61c90834dc19ee85def363ff035a0bbadbf00a367661bafd2fae92909671371d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
