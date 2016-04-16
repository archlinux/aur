# Maintainer: Matthew Gamble

pkgname=python-luckydonald-utils
pkgver=0.43
pkgrel=1
pkgdesc="A collection of generic utilities for use in any python project"
arch=("any")
url="https://pypi.python.org/pypi/luckydonald-utils/${pkgver}"
license=("GPL")
depends=("python")
makedepends=("python-setuptools")
optdepends=("python-crypto" "python-magic" "python-pillow" "python-pytz" "python-requests" "python-usersettings")
source=(
    "https://pypi.python.org/packages/source/l/luckydonald-utils/luckydonald-utils-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/luckydonald/luckydonald-utils/v${pkgver}/LICENSE"
    "remove-pip-requirement.patch"
)
sha256sums=('f9674267f3852b24c92115f703cb3e0390e3f3bd32362be8dce5a23fc7e21efc'
            'cccc354afb83f6c9c3d9937a66afabe5826f9673b5129e8b3b509cb5f1e11d9a'
            'fae60af4816b41bbbf49951c212d850422fe2e4d278394b7781b7c9ea76d1d4f')

prepare() {
    cd "luckydonald-utils-${pkgver}"
    patch -p1 < ../remove-pip-requirement.patch
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-luckydonald-utils/LICENSE"
    cd "luckydonald-utils-${pkgver}"
    python setup.py install --root="$pkgdir"
}
