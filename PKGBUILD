# Maintainer Marcus Hoffmann <bubu@bubu1.eu>
# previous maintainer: Jack Random < jack(at)random(dot)to >
# previous maintainer: Carl George < arch at cgtx dot us >

_pkgname="hiredis"
pkgname=python-${_pkgname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Python wrapper for hiredis"
arch=("i686" "x86_64")
url="https://github.com/redis/hiredis-py"
license=("BSD")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('996021ef33e0f50b97ff2d6b5f422a0fe5577de21a8873b58a779a5ddd1c3132')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHONPATH=. python test.py
}


build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
    python setup.py build_ext --inplace
}

package() {
    depends=("python")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1 --skip-build
    install -D -p -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
