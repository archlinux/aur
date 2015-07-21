# Maintainer: Heenry78 <henry78@gmx.at>
# Contributor: ngoonee <ngoonee.talk@gmail.com>
# Contributor: Marco A Rojas <marquicus@gmail.com>
# Contributor: Corentin Rossignon <corentin.rossignon@gmail.com>
pkgname=evolution-mapi
pkgver=3.16.4
pkgrel=1
pkgdesc="MAPI plugin for evolution."
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL3')
depends=("evolution>=${pkgver}" "openchange")
makedepends=("intltool")
source=(http://ftp.gnome.org/pub/gnome/sources/evolution-mapi/${pkgver:0:4}/${pkgname}-${pkgver}.tar.xz
        auto_reconnection.patch)
sha256sums=('7f8b8f18cf284cca13263b363db9d980881559d4fa7a93c0c1fc3552c2d5127e'
            '9e9f6259452107195f38729b5a1c2803d95361aa3848fa9a980b2a25ca156983')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	patch -p1 < "${srcdir}/auto_reconnection.patch"

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
}
