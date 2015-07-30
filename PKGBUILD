# Maintainer: Martin Poehlmann <mpdeimos@outlook.com>

pkgname=california
pkgver=0.4.0
pkgrel=1
pkgdesc='A new calendar application for GNOME 3. It is currently under heavy development.'
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/California"
license=('LGPL2.1')
depends=('evolution-data-server' 'libgee' 'xdg-utils')
makedepends=('vala' 'intltool' 'gnome-common' 'yelp-tools' 'gobject-introspection')
install="${pkgname}.install"
source=('https://download.gnome.org/sources/california/0.4/california-0.4.0.tar.xz')
sha256sums=('b25f356363a9f8f8f93c7ab78af02de39f9c3b71964663129ac9904de9147eb6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr
	sed -i 's#californiadocdir = ${prefix}#californiadocdir = ${datadir}#g' Makefile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir"
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
