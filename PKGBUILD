# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-types-waitress
_name=${pkgname#python-}
_name=${_name//-/_}
pkgdesc="Typing stubs for waitress"
url="https://github.com/python/typeshed"

pkgver=3.0.1.20250801
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
b2sums=("e344feb22f236956060b9cf46a192c1748273245bd55528488ab569b2e24b0d1abcedc9268d746a2f07deb0b892921d5af9a11efca395268914e1047d93c59a1")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
