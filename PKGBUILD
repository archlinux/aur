# Maintainer: mickele
pkgname=tclreadline
pkgver=2.3.6
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
source=("https://github.com/flightaware/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('478b13c2de153b5423f34f007e94d7ecbe2840b451501cc1132663750e2be0d3')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -ivf
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
