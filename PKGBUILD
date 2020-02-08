# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
_pkgname="${pkgname%2}"
pkgver=2.0.1
pkgrel=1
pkgdesc="Command-line trace converter (V2)"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils' 'asciidoc' 'xmlto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('8a6aeb72c5f12715d8b5ace6c7643667a4c385e96aedc507490ef57482a82649df0c0253f433aae5ad4b3dc9d0557483ea3854f0c5ea94b2036656b1a877ca5d')

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
