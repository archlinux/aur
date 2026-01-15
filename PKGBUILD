# Maintainer: peippo <christoph.fink@gmail.com>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-types-pytz
_name=${pkgname#python-}
_name=${_name//-/_}
pkgdesc="Typing stubs for pytz"
url="https://github.com/python/typeshed"

pkgver=2025.2.0.20251108
pkgrel=2

arch=("any")
license=("Apache-2.0")

depends=(
    "python"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('cb6486a0292802e01cad08639f1ae5163830dada705d5dd8a2d35a92d08dd7a55dc34087fbe239d909e8c2e9379c24f03ceb22c16efcaaf8910e1dd6fae3510a')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
