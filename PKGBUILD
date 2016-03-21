# Maintainer: Heenry78 <henry78@gmx.at>
# Contributor: ngoonee <ngoonee.talk@gmail.com>
# Contributor: Marco A Rojas <marquicus@gmail.com>
# Contributor: Corentin Rossignon <corentin.rossignon@gmail.com>
pkgname=evolution-mapi
pkgver=3.20.0
pkgrel=1
pkgdesc="MAPI plugin for evolution."
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL3')
depends=("evolution>=${pkgver}" "openchange")
makedepends=("intltool")
source=(http://ftp.gnome.org/pub/gnome/sources/evolution-mapi/${pkgver:0:4}/${pkgname}-${pkgver}.tar.xz
        auto_reconnection.patch)
sha256sums=('050559d09cba233e27870c7228c04a6ef365e057972f7346879caa3c208cc903'
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
