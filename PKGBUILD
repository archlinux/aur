# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgname=qrouter
pkgver=1.4.90
pkgrel=1
pkgdesc='Multi-level, over-the-cell maze router'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qrouter/'
license=('GPL')
depends=('tk')
source=("https://github.com/RTimothyEdwards/qrouter/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Solve undefined symbol in qrouter.so
    sed -i '/static GATE/{N;s/static GATE\nFindGateNode/GATE\nFindGateNode/}' delays.c
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
