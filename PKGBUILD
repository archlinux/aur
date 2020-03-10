# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-unicodecsv"
_name=${pkgname#python-}
pkgdesc="A drop-in replacement for the csv module that supports unicode strings"
url="https://github.com/jdunck/python-unicodecsv"

pkgver=0.14.1
pkgrel=3

arch=("any")
license=("BSD")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/jdunck/python-unicodecsv/master/LICENSE"
)
sha256sums=(
    "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"
    "a3b3fcd3f2b3e97b4c4ffc354f719e1519dc95dc0b09d82f769538feeb7db032"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
