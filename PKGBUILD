# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.5.6
pkgrel=1
pkgdesc="Command-line trace converter"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('c6d80f3875f42d9dd3ce48c57df7797849a2c7b90a8ea73f47d2dd60363bdfc6f47284a735d15d83faeeb239aeaf75c78c015809cc8786989743d756c97fa936')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr'
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
