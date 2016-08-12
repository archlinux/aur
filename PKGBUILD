# Maintainer: Sébastien LEBEAU <sebcbi1 at gmail dot com>
# Contributor: Patrick Griffis <tingpign@fedoraproject.org>

pkgname=transmission-remote-gtk
pkgver=1.3.0
pkgrel=1
pkgdesc='GTK remote control for the Transmission BitTorrent client'
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
arch=('i686' 'x86_64')
license=('GPL2')
source=("https://github.com/transmission-remote-gtk/transmission-remote-gtk/releases/download/$pkgver/transmission-remote-gtk-$pkgver.tar.xz")
sha256sums=('6fe30b4561681458500e61cc6db10c3b4b3771f69e2f6a74dbb7a20b03a3cbe6')
depends=('curl' 'libnotify' 'libproxy' 'geoip' 'desktop-file-utils' 'gtk3' 'json-glib')
# Optionally 'libmrss'
makedepends=('intltool')

prepare() {
	cd "$pkgname-$pkgver"

	# Fix installing appdata
	sed -i 's|appdata_XML|appstream_XML|g' data/Makefile.in
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --disable-desktop-database-update
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
}
