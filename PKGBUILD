# Maintainer: fenuks

_pkgname=fuzzywuzzy
pkgname=python-${_pkgname}
pkgver=0.15.1
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
source=("https://pypi.python.org/packages/26/5a/e03ff762537b100b3e987071698d9942b669a32a46f87968c515cad44df2/fuzzywuzzy-0.15.1.tar.gz"
        "LICENSE")
md5sums=('fd587ade352d3f337ca0288a7418cf0b'
         'afa01d831fdc3c0b681836e711f60f88')
sha256sums=('3ed1a125d682208aa327516eb56fc69cff76215230efa0792afd1f3cb6975214'
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
