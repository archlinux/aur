# Maintainer: Tilman Blumenbach <tilman@ax86.net>
pkgname=tsocks-tools
pkgver='1.8beta5'
pkgrel=4
pkgdesc='Misc. tools from the tsocks package'
arch=('i686' 'x86_64')
url="http://tsocks.sf.net"
license=('GPL')
depends=('glibc')
source=("https://downloads.sf.net/tsocks/tsocks-${pkgver}.tar.gz"
        prognames.patch)

prepare() {
    cd "${srcdir}/tsocks-1.8"

    patch -Np 1 -i "${srcdir}/prognames.patch" || return 1
}

build() {
    cd "${srcdir}/tsocks-1.8"

    autoreconf
    ./configure
    make inspectsocks saveme validateconf || return 1
}

package() {
    cd "${srcdir}/tsocks-1.8"

    install -D saveme "${pkgdir}/usr/bin/tsocks-saveme"
    install validateconf "${pkgdir}/usr/bin/tsocks-validateconf"
    install inspectsocks "${pkgdir}/usr/bin"
}

sha256sums=('849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863f5b347'
            '7d3898529d99ca59d06e44f486e56921532443a8daf0f3da4e4aad63b9a46dcb')
