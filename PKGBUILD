# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
_pkgname="${pkgname%2}"
pkgver=2.0.4
pkgrel=1
pkgdesc="Command-line trace converter (V2)"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils' 'asciidoc' 'xmlto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('deb9c22ae4f32f0f082068730d936471207dfc407ffd073e06ee36f94e81d45f1bc8e8f8fba1fa42d252ce17b203428799644c0acee17c40cdbfee967ffbadca')

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
