# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Woody Gilk aka Shadowhand <woody.gilk@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gmrun
pkgver=0.9.4w
pkgrel=1
pkgdesc="A simple program which provides a run program window"
arch=('x86_64')
url="https://github.com/wdlkmpx/gmrun"
license=('GPL')
depends=('gtk2' 'popt')
source=($pkgname-$pkgver.tar.gz::https://github.com/wdlkmpx/gmrun/archive/$pkgver.tar.gz
	return-type-gtk_completion_line_get_type.patch
	history_string.patch)
md5sums=('e3fa3ebfa6d81675ba59152372fb2f7b'
         '0b467e3cdb14ca9f93176d3193659af7'
         'f33450f3fae35ed6111aec8417c4d3d6')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -p1 -i "$srcdir/return-type-gtk_completion_line_get_type.patch"
	patch -p1 -i "$srcdir/history_string.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
