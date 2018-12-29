# Maintainer: fenuks

_pkgname=fuzzywuzzy
pkgname=python-${_pkgname}
pkgver=0.17.0
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
md5sums=('93e853faee3ac4545f18a4b475601960'
         'afa01d831fdc3c0b681836e711f60f88')
sha256sums=('78c74f75a293c75ae318ec0274efd9fab1c3fb59b2df3f3c2c10db3466413e12'
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
