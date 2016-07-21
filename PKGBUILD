# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgname=psurface
pkgver=1.3.1
pkgrel=1

pkgdesc='Piecewise linear bijections between triangulated surfaces'
arch=('i686' 'x86_64')

url='http://numerik.mi.fu-berlin.de/dune/psurface/index.php'
license=('custom')

depends=('gcc-libs')

source=("https://github.com/psurface/psurface/archive/${pkgname}-${pkgver}.tar.gz")

md5sums=('b7b0bb4221a162926d599702ff004d9a')

build() {
    cd "${pkgname}-${pkgname}-${pkgver}"

    ./makedist.sh

    cd lib${pkgname}-${pkgver}

    autoreconf -sfi

    ./configure --prefix=/usr

    make
}

package() {
    cd "${pkgname}-${pkgname}-${pkgver}/lib${pkgname}-${pkgver}"

    make install DESTDIR="${pkgdir}"

    install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
