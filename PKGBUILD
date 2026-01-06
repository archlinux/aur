# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-cityhash'
_pkgname='cityhash'
pkgver='0.4.10'
pkgrel=1
pkgdesc="Python bindings for CityHash"
url="https://github.com/escherba/python-cityhash"
depends=(python)
makedepends=(cython python-build python-py-cpuinfo python-installer python-setuptools cython)
checkdepends=(python-pytest)
license=('MIT')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7e35da9aaf5fcf91da3fea23405874db55ffa58b1abc441d39cce0c8704a9c15')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#check() {
    #cd "${_pkgname}-${pkgver}"
    #local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    #PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
#}
