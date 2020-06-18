# Maintainer Marcus Hoffmann <bubu@bubu1.eu>
# previous maintainer: Jack Random < jack(at)random(dot)to >
# previous maintainer: Carl George < arch at cgtx dot us >

_pkgname="hiredis"
pkgname=python-${_pkgname}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python wrapper for hiredis"
arch=("i686" "x86_64")
url="https://github.com/redis/hiredis-py"
license=("BSD")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('aa59dd63bb3f736de4fc2d080114429d5d369dfb3265f771778e8349d67a97a4')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHONPATH=. python test.py
}


build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1 --skip-build
    install -D -p -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
