# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Adrian Hühn <adrian.huehn@web.de>

pkgname=libsearpc
pkgver=3.1
_pkgver=${pkgver}-latest
pkgrel=1
pkgdesc="A simple and easy-to-use C language RPC framework (including both server side & client side) based on GObject System."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/libsearpc"
license=('GPLv3')
depends=("glib2>=2.26.0" "jansson>=2.2.1" "python2-gobject2>=2.26.0" 'python2-simplejson')
source=("libsearpc-v${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz"
        "libsearpc.pc.patch")
sha256sums=('13fddb5494f5367dc36c31afb7b7b868570225e37f6bb7a13ec6e323ef527eb2'
            'aec39a303aaebc0777a22d8c53367f52f619654d63f62b362d75c1c599e632f4')

prepare () {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    patch -p1 -i "${srcdir}"/libsearpc.pc.patch
}

build () {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr PYTHON=/usr/bin/python2
    make
}

check () {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    make check
}

package () {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    make DESTDIR="${pkgdir}" install
}
