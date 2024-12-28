# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-posixpatht
_name=${pkgname#python-}
pkgver=0.0.4
pkgrel=4
epoch=
pkgdesc="Another posixpath module, supports names that contain backslashes."
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
sha256sums=('adb5c1a41e0eecee4317b1032737f7d4c19e5093abfd856a95b4732ff613fb08')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
