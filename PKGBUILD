# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-cityhash'
pkgver='0.4.7'
pkgrel=1
pkgdesc="Python bindings for CityHash"
url="https://github.com/escherba/python-cityhash"
depends=(python)
makedepends=(cython python-build python-py-cpuinfo python-installer python-setuptools cython)
checkdepends=(python-pytest)
license=('MIT')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/escherba/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d556cb78dc436e9ef5b5999f645b0dd67315002cd7b812b438507f6f83b972fa')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "${pkgname}-${pkgver}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}
