# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=micropython-git
_pkgname=micropython
pkgver=20150608
pkgrel=1
pkgdesc="Python 3 for microcontrollers, unix version."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi')
makedepends=('git')
provides=('micropython')
conflicts=('micropython')
source=("${_pkgname}"::'git://github.com/micropython/micropython.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${_pkgname}/unix"
    make
}

package() {
    cd "${_pkgname}/unix"
    install -Dm755 "micropython" "${pkgdir}/usr/bin/micropython"
    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

