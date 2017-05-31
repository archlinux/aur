# Maintainer: NBonaparte

_pkgname=fuzzywuzzy
pkgname=python2-${_pkgname}
pkgver=0.15.0
pkgrel=1
pkgdesc="Fuzzy string matching like a boss"
arch=("any")
url="https://pypi.python.org/pypi/${_pkgname}"
license=("custom:SeatGeek")
depends=("python2")
optdepends=('python2-levenshtein: provides a 4-10x speedup in string matching')
makedepends=("python2-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
# install=$pkgname.install
source=("https://pypi.python.org/packages/fc/03/052c31efd8016e58f498fb05ea3717a120108a379548dabe18a3890d48b0/fuzzywuzzy-0.15.0.tar.gz"
        "LICENSE")
md5sums=('97cbc62d3c4c220b7c566a0e72ef651e'
         'afa01d831fdc3c0b681836e711f60f88')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -D -m 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
