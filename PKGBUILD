# Maintainer: Carl George < arch at cgtx dot us >

_name="unicodecsv"
_module="${_name}"

pkgname="python-${_module}"
pkgver="0.14.1"
pkgrel="2"
pkgdesc="Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*."
arch=("any")
url="https://github.com/jdunck/python-${_name}"
license=("BSD")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jdunck/python-unicodecsv/master/LICENSE")
sha256sums=('018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc'
            'a3b3fcd3f2b3e97b4c4ffc354f719e1519dc95dc0b09d82f769538feeb7db032')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python")
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
