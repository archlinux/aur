# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-luckydonald-utils
pkgver=0.52
pkgrel=1
pkgdesc="A collection of generic utilities for use in any python project"
arch=("any")
url="https://pypi.python.org/pypi/luckydonald-utils"
license=("GPL")
depends=("python")
makedepends=("python-setuptools")
optdepends=("python-crypto" "python-magic" "python-pillow" "python-pytz" "python-requests" "python-usersettings")
source=(
    "https://pypi.python.org/packages/08/96/3869a090a312182674471c059b0f9f60d14bea7ba54fa111b34fa9c130bf/luckydonald-utils-0.52.tar.gz"
    "https://raw.githubusercontent.com/luckydonald/luckydonald-utils/bcfd1a352172b5f6607076e1632438b552f1ec70/LICENSE"
    "remove-pip-requirement.patch"
)
sha256sums=(
    "51d2331029f85fc3f60eb59b912a660c1072ec4c4734cca21aa996e8efe7fc69"
    "cccc354afb83f6c9c3d9937a66afabe5826f9673b5129e8b3b509cb5f1e11d9a"
    "b91159f0ce525c209b6e71179bb38958e52c0b3cb04bba97e5e3f987e51ecb0a"
)

prepare() {
    cd "luckydonald-utils-${pkgver}"
    patch -p1 < "${srcdir}/remove-pip-requirement.patch"
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-luckydonald-utils/LICENSE"
    cd "luckydonald-utils-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
