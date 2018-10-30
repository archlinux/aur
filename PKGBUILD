# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=gnome-online-miners-disabled
pkgver=3.30.0
pkgrel=1
pkgdesc="Disables GNOME Online Miners and replaces them with dummy services while providing non-breaking GNOME Online Accounts integration"
arch=(x86_64)
url="https://example.com"
license=(GPL)
depends=(libgdata gnome-online-accounts grilo libzapojit tracker gfbgraph dleyna-server)
makedepends=(gnome-common git)
conflicts=(gnome-online-miners)
provides=(gnome-online-miners)

source=('dummy-dbus.service')
sha256sums=('43cbf9d0c18ff45a39ae4a671792af4fd58a3a2cc426dc131cd7caab0bd9b804')

_void_service() {

	local name="$1";

	if [ "$name" != "" ]; then
		install -D -m644 "${srcdir}/dummy-dbus.service" "${pkgdir}/usr/share/dbus-1/services/org.gnome.OnlineMiners.${name}.service";
		sed -i "s|__NAME__|${name}|g" "${pkgdir}/usr/share/dbus-1/services/org.gnome.OnlineMiners.${name}.service";
	fi;

}

package() {

	cd $pkgdir;

	_void_service "Facebook";
	_void_service "Flickr";
	_void_service "GData";
	_void_service "MediaServer";
	_void_service "Owncloud";
	_void_service "Zpj";

}

