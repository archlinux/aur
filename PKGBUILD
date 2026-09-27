# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
_name=numpy-groupies
pkgver=0.12.3
pkgrel=1
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
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('3036f551c9f9bfdfba69b7b5dfcef6e5a6174a9c39e3f5d4cb8ede692bbc0cb1')

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
