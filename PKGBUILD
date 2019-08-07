# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=python-dpkt-git
_pkgname=dpkt
pkgver=v1.9.2.r33.2c6aada
pkgrel=1
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('any')
url="https://github.com/kbandla/dpkt"
license=('BSD')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dpkt::git+https://github.com/kbandla/dpkt.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}"
}
