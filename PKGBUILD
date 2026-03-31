# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-calcephpy
_name=${pkgname#python-}
pkgdesc='Python interface for the CALCEPH Library'
pkgver=4.0.5
pkgrel=1
url='https://www.imcce.fr/inpop/calceph'
# license names from https://spdx.org/licenses/
license=('CECILL-C' 'CECILL-B' 'CECILL-2.1')
arch=('x86_64')
depends=(
    'glibc'
    'python-numpy'
)
makedepends=(
    'cmake'
    'cython'
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('7412b394c92e6c2e2df2f218489f3cf46365f80dcc2c036d71054a2aa4c3c40c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING_CECILL_B.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_CECILL_B.LIB"
    install -Dm644 COPYING_CECILL_C.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_CECILL_C.LIB"
    install -Dm644 COPYING_CECILL_V2.1.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_CECILL_V2.1.LIB"
}
