# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
_name=numpy-groupies
pkgver=0.11.3
pkgrel=2
pkgdesc='Optimised tools for group-indexing operations for python numpy'
arch=("any")
url="https://github.com/ml31415/numpy-groupies"
license=('BSD-2-Clause')
depends=('python' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
optdepends=(
    'python-numba: for numba backend'
    'python-pandas: for pandas backend'
)
source=("git+${url}.git#tag=v${pkgver}"
        "0001-make-it-PEP-639-compliant.patch")
sha256sums=('fd02ca0e55a424919e3de7e3df6b6ebf6c1cddb508a7f749057c32076bca5a14'
            'cce49e92309bf24a886393b2356b7d0cae12f9ff66827f2e09361f34fb769e90')

prepare() {
    cd "${_name}"
    git apply < ../0001-make-it-PEP-639-compliant.patch
}

build() {
    cd "${_name}"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
