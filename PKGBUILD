# Maintainer: mickele
pkgname=tclreadline
pkgver=2.3.5
pkgrel=1
pkgdesc="GNU readline for interactive tcl shells"
url="https://github.com/flightaware/tclreadline"
arch=('x86_64' 'i686')
license=('BSD')
depends=('tcl' 'readline')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install=''
source=("https://github.com/flightaware/${pkgname}/archive/v${pkgver}.tar.gz"
        "alloc-invalid-block.patch")
sha256sums=('b90c3f10c75a959a0e58bce8fbe16a3b14f1a234e8e68297eb4fa290e8b304be'
            'fe50654e7b1648cfd6220ff67d85fea62066af32ca640c0488d500416875d02b')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -ivf
    patch -Np1 -i "${srcdir}/alloc-invalid-block.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr \
                --with-tcl=/usr/lib \
                --with-tcl-includes=/usr/include/tcl
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
