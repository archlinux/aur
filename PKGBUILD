# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=micropython-git
pkgver=20150822
pkgrel=1
pkgdesc="Python 3 for microcontrollers, unix version."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi')
makedepends=('git' 'python')
provides=('micropython')
conflicts=('micropython')
optdepends=('micropython-lib')
source=('git://github.com/micropython/micropython.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/micropython"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${srcdir}/micropython/unix"
    sed -i 's|/local||' Makefile
    make
}

package() {
    cd "${srcdir}/micropython/unix"
    # install -Dm755 "micropython" "${pkgdir}/usr/bin/micropython"
    make DESTDIR="$pkgdir" install

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

