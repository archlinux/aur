# Maintainer: fenuks

_pkgname=fuzzywuzzy
pkgname=python-${_pkgname}
pkgver=0.18.0
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
source=("https://github.com/seatgeek/fuzzywuzzy/archive/${pkgver}.tar.gz"
        "LICENSE")
md5sums=('33a44f80391aa936a8e6f5cb790322f4'
         'afa01d831fdc3c0b681836e711f60f88')
sha256sums=('26795bd6c319a8c789d62ecbe95e29a97711f0176d3beea04ce510981095f696'
            '116d3ce8c10068e8211e9f71c2a80c3fa4f184f0968cae0d0635ff979fedc9ac')

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
