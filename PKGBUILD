# Maintainer: a821 <a821 - mail - de>

pkgname=python-numpy-groupies
_name=numpy-groupies
pkgver=0.14.0
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
sha256sums=('71149fef9687ccd41dbd92806f0935d5ea123eed4691a75aa96c3d2a5d5af4c5')

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
