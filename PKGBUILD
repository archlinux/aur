# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=python-jmbase-git
pkgver=0.6.1.r91.ga050a89
pkgrel=1
pkgdesc="Base JoinMarket library including commands defining client-server (daemon) messaging protocol"
url="https://github.com/JoinMarket-Org/joinmarket-clientserver/tree/master/jmbase"
depends=( 'python-future' 'python-twisted' 'python-service-identity' 'python-chromalog' )
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
    cd "${srcdir:?}/$pkgname/jmbase"
    python setup.py test
}
build() {
    cd "${srcdir:?}/$pkgname/jmbase"
    python setup.py build
}
package() {
    cd "${srcdir:?}/$pkgname/jmbase"
    python setup.py install --root="${pkgdir:?}" --optimize=1
}
