# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

pkgname=necta-wifi-mouse
pkgver=1.2.0
pkgrel=1
pkgdesc="Server for the WiFi Mouse smartphone app"
arch=("x86_64")
url="https://wifimouse.necta.us/"
# according to the about dialog of the program, sources are not published
license=("GPL-2.0-only")
depends=(
	"avahi"
	"gdk-pixbuf2"
	"glib2"
	"glibc"
	"gtk3"
	"libgcc"
	"libstdc++"
	"libx11"
	"libxtst"
)
options=("!strip" "!debug")
source=("$pkgname-$pkgver.deb::https://wifimouse.necta.us/download/mouseserver-64.deb")
noextract=("$pkgname-$pkgver.deb")
sha256sums=("398cffa603da0bc3f94c984d549c362f01985e896de1d37f4ddcd9845345dc49")

prepare() {
	bsdtar -xOf "$pkgname-$pkgver.deb" data.tar.gz | bsdtar -xf -
}

package() {
	install -Dm 755 usr/sbin/mouseserver -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/share/mouseserver/icons/* -t "$pkgdir/usr/share/mouseserver/icons/"
	install -Dm 644 usr/share/applications/mouseserver.desktop -t "$pkgdir/usr/share/applications/"
	sed -i 's|^Exec=.*|Exec=/usr/bin/mouseserver|' \
		"$pkgdir/usr/share/applications/mouseserver.desktop"
}
