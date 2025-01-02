# Maintainer: Lu Xu <oliver_lew at outlook dot com>
#
pkgname=python-calcephpy
_name=${pkgname#python-}
pkgdesc='Python interface for the CALCEPH Library'
pkgver=4.0.4
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
sha256sums=('68753f112f4dd6ae4ce4ad1c7d620e6e38dcde518067883e9214cd4cfb3f52ef')

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
