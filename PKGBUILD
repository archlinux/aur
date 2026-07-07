# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-calcephpy
_name=${pkgname#python-}
pkgdesc='Python interface for the CALCEPH Library'
pkgver=5.0.0
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
sha256sums=('abf52b8d2898299ff837f90ed9824cc40d70745700b440374d6f375a86a5e831')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 COPYING_CECILL_B.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_CECILL_B.LIB"
    install -Dm644 COPYING_CECILL_C.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_CECILL_C.LIB"
    install -Dm644 COPYING_CECILL_V2.1.LIB "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_CECILL_V2.1.LIB"
}
