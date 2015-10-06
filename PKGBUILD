# Maintainer: fenuks

_pkgname=fuzzywuzzy
pkgname=python-${_pkgname}
pkgver=0.7.0
pkgrel=1
pkgdesc="Fuzzy string matching like a boss"
arch=("any")
url="https://pypi.python.org/pypi/${_pkgname}"
license=("custom:SeatGeek")
depends=("python")
optdepends=('python-levenshtein: provides a 4-10x speedup in string matching')
makedepends=("python-setuptools")  
conflicts=("${pkgname}" "${pkgname}-git")
# install=$pkgname.install
source=("https://pypi.python.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('d3161ad2aff88385eabb560c1d0d063e'
         'afa01d831fdc3c0b681836e711f60f88')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -D -m 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
