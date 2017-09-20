# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.5.3
pkgrel=1
pkgdesc="Command-line trace converter"
arch=('i686' 'x86_64')
url="http://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2>=2.22.0' 'elfutils>=0.154')
source=("http://www.efficios.com/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('0728d73d62ca4cd77db8770af34e792ec2dfaefb730c6bf1e0b0f9b3114271d8f9a51a163034ce33b7fc876f993fb39346ead878803a959edac1ccaf6f34ceb6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
