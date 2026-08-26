# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-fasttext
_pkgname="${pkgname#python-}"
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

pkgver=0.9.3
pkgrel=1

arch=("x86_64")
license=("BSD-3-Clause")

makedepends=(
    "pybind11"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "python-numpy"
    "python-pytorch"
    "python-scipy"
)
options=("!debug")

source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz")
b2sums=("a24a891650ea12c50544a4baa0c3579ffe68fe2b28e5a43b35fb334113edce5a94fba987ddda1d35b78a93eed76e81d256c9480e3a6a8b85aed619522c889759")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
