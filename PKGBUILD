# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
_pkgname="${pkgname%2}"
pkgver=2.0.3
pkgrel=1
pkgdesc="Command-line trace converter (V2)"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils' 'asciidoc' 'xmlto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('357857afc1f9df4c15c8fd897b46f12b4a62cd164ecb1ab1babdfa5eb06534dadf1798b99e1290d5999a7b85ba3c9b269be4f14afd85e7ce163c5bfae1c6983c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr'
    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
