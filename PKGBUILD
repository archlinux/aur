# Maintainer: Matthew Gamble

pkgname=python-luckydonald-utils
pkgver=0.41
pkgrel=2
pkgdesc="A collection of generic utilities for use in any python project"
arch=('any')
url="https://pypi.python.org/pypi/luckydonald-utils/${pkgver}"
license=("GPL")
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-crypto' 'python-magic' 'python-pillow' 'python-pytz' 'python-requests' 'python-usersettings')
source=(
    "https://pypi.python.org/packages/source/l/luckydonald-utils/luckydonald-utils-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/luckydonald/luckydonald-utils/master/LICENSE"
)
sha256sums=('cdef1432aac4a931ff2df50cf498f57132c5faab763a0cdf1973efadbf5bff32'
            'c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad')

prepare() {
    cd "luckydonald-utils-${pkgver}"
    patch -p0 < ../../remove-pip-requirement.patch
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-luckydonald-utils/LICENSE"
    cd "luckydonald-utils-${pkgver}"
    python setup.py install --root="$pkgdir"
}
