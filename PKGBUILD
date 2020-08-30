# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=python-jmclient-git
pkgver=0.7.0.r3.gc90432e
pkgrel=1
pkgdesc="JoinMarket library for client protocol"
url="https://github.com/JoinMarket-Org/joinmarket-clientserver/tree/master/jmclient"
# See dependencies listed here; https://github.com/JoinMarket-Org/joinmarket-clientserver/blob/master/jmbase/setup.py
depends=( 'python-twisted' 'python-service-identity' 'python-chromalog' )
makedepends=('git' 'python-setuptools')
checkdepends=('python-jmbitcoin-git' 'python-jmbase-git' 'python-secp256k1-git' 'python-txtorcon')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+https://github.com/JoinMarket-Org/joinmarket-clientserver.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
check() {
    cd "${srcdir:?}/$pkgname/jmclient"
    python setup.py test
}
build() {
    cd "${srcdir:?}/$pkgname/jmclient"
    python setup.py build
}
package() {
    cd "${srcdir:?}/$pkgname/jmclient"
    python setup.py install --root="${pkgdir:?}" --optimize=1
}
