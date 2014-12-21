# Contributor: Tilman Blumenbach <tilman@ax86.net>
pkgname=tsocks-tools
pkgver='1.8beta5'
pkgrel=3
pkgdesc='Misc. tools from the tsocks package'
arch=('i686' 'x86_64')
url="http://tsocks.sf.net"
license=('GPL')
depends=('glibc')
source=("http://downloads.sf.net/tsocks/tsocks-${pkgver}.tar.gz"
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

md5sums=('51caefd77e5d440d0bbd6443db4fc0f8'
         '31f3cef79c70578b3dc8d1d8776154c2')
