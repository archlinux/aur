# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Jochen Jägers (JochenJ) <aur@diezonks.de>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=networkmanager-libreswan
# Current version can be found over at https://download.gnome.org/sources/NetworkManager-libreswan/
pkgver=1.2.24
pkgrel=1
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url='https://networkmanager.dev/docs/vpn/'
depends=('libsecret' 'libreswan' 'libnl' 'libnm' 'gtk3' 'libnma')
makedepends=('glib2-devel' 'intltool' 'python' 'gettext')
source=("https://download.gnome.org/sources/NetworkManager-libreswan/${pkgver::3}/NetworkManager-libreswan-${pkgver}.tar.xz")
sha256sums=('3d491c726339f0cafd9a35e4e037add58617f3d5d683b75a545ddc6fbe382457')

build() {
	cd "NetworkManager-libreswan-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--libexecdir=/usr/lib/NetworkManager \
		--enable-more-warnings=yes \
		--disable-static
	make
}

package() {
	cd "NetworkManager-libreswan-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
