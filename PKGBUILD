# Maintainer: drarig29 <corentingirard.dev@gmail.com>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Tony Smith <bakugantony@proton.me>

pkgname=libunity
pkgver=7.2.6
pkgrel=18
pkgdesc='Library for instrumenting and integrating with all aspects of the Unity shell'
arch=('i686' 'x86_64')
url="https://github.com/MercySimp/libunity"
license=('LGPL3.0')
depends=('dee' 'gtk3' 'libdbusmenu-glib')
makedepends=('gnome-common' 'gobject-introspection' 'intltool' 'vala')
source=("${pkgname}_${pkgver}.tar.gz::$url/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('c66ae9319421f42428115c7249d0c1c4aca5b55e31d81efdd736d7241f4d6a93')

prepare() {
	cd "$srcdir/${pkgname}_${pkgver}"
	patch -p1 < "0001-Fix-FTB-with-recent-vala-requiring-non-public-abstra.patch"
	patch -p1 < "libunity-7.1.4-vala-053.patch"
}

build() {
	cd "$srcdir/${pkgname}_${pkgver}"
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
	make
}

package() {
	cd "$srcdir/${pkgname}_${pkgver}"
	make DESTDIR="$pkgdir" install
}
