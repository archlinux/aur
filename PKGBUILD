# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-types-mock
_name=${pkgname#python-}
_name=${_name//-/_}
pkgdesc="Typing stubs for mock"
url="https://github.com/python/typeshed"

pkgver=5.2.0.20250924
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
b2sums=('7ab500eaaa3244d5144967c46f59a7971884001689ad683acdfe0fcc7d8a9f8c17dc7b5282d20927e2e038c548c6035ff02a7392ff5e1a4d96708d55d172ca8b')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
