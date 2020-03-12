# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=python-jmbitcoin-git
pkgver=0.6.1.r91.ga050a89
pkgrel=1
pkgdesc="JoinMarket library for bitcoin protocol"
url="https://github.com/JoinMarket-Org/joinmarket-clientserver/tree/master/jmbitcoin"
depends=( 'python-future' 'python-coincurve' )
makedepends=('git' 'python-setuptools')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+https://github.com/JoinMarket-Org/joinmarket-clientserver.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
check() {
    cd "${srcdir:?}/$pkgname/jmbitcoin"
    python setup.py test
}
build() {
    cd "${srcdir:?}/$pkgname/jmbitcoin"
    python setup.py build
}
package() {
    cd "${srcdir:?}/$pkgname/jmbitcoin"
    python setup.py install --root="${pkgdir:?}" --optimize=1
}
