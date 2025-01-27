# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
pkgver=2.1.0
pkgrel=1
pkgdesc="Trace manipulation toolkit"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('glibc' 'glib2' 'libelf' 'python')
makedepends=('asciidoc' 'xmlto' 'swig' 'python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://www.efficios.com/files/babeltrace/babeltrace2-${pkgver}.tar.bz2")
sha512sums=('807154d5ea4d987cca0c4ec01bf3566e255e30114da9a968952fd8c9ea04a50fc66228838a1ea7aed9f0ee0d8b6c3ca216104f39dbc92b5c69162118b8b2addf')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr' --enable-debug-info --enable-python-bindings --enable-python-plugins
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
