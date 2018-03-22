# Maintainer: NBonaparte

_pkgname=fuzzywuzzy
pkgname=python2-${_pkgname}
pkgver=0.16.0
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
source=("https://github.com/seatgeek/fuzzywuzzy/archive/${pkgver}.tar.gz"
        "LICENSE")
md5sums=('eec5695d5553b3d2dd944cf52248c33a'
         'afa01d831fdc3c0b681836e711f60f88')
sha256sums=('e5303988caa0cab06416122ce944d6313ccb21f88bd35c42ad36f2bd215907c8'
            '116d3ce8c10068e8211e9f71c2a80c3fa4f184f0968cae0d0635ff979fedc9ac')

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
