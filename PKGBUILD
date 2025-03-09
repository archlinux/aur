# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pydevicetree
_name=${pkgname#python-}
pkgver=0.0.13
pkgrel=5
epoch=
pkgdesc="This is a Python 3 library for parsing, querying, and modifying Devicetree Source v1 files as described in the Devicetree Specification v0.2."
arch=('any')
url="https://pypi.org/project/pydevicetree"
license=('Apache-2.0')
groups=()
_pydeps=(
    pyparsing)
depends=(
    python
    "${_pydeps[@]/#/python-}")
_pymakedeps=(
    build
    installer
    wheel
    setuptools)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('5700c05df89bad8fd729c11aa6f764a3323bcb3796f13b32481ae34445cfc1b7')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
