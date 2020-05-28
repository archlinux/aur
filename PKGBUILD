# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=python-jmclient-git
pkgver=0.6.2.r59.gce35dee
pkgrel=1
pkgdesc="JoinMarket library for client protocol"
url="https://github.com/JoinMarket-Org/joinmarket-clientserver/tree/master/jmclient"
depends=( 'python-future' 'python-jmbase-git' 'python-mnemonic' 'python-argon2_cffi'
           'python-bencoder-pyx' 'python-pyaes' 'python-urldecode'
         )
makedepends=('git' 'python-setuptools')
checkdepends=('python-jmbitcoin-git')
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
