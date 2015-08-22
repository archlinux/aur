pkgname=lantern
pkgver=2.0.0+stable
pkgrel=2
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the
open Internet. Stable version'
arch=('i686' 'x86_64')
url='https://getlantern.org/'
license=('custom')
# I got it by ldd the lantern-binary as deb metadata doesn't provides it.
# And remove duplicated, like atk required by gtk3
depends=('gtk3' 'bzip2' 'dbus' 'glib2' 'libappindicator-gtk3' 'xcb-util'
	 'zlib' 'mesa')

source_i686=("lantern-installer-32.deb::https://github.com/getlantern/lantern-binaries/blob/master/lantern-installer-32.deb?raw=true")
source_x86_64=("lantern-installer-64.deb::https://github.com/getlantern/lantern-binaries/blob/master/lantern-installer-64.deb?raw=true")

sha1sums_i686=('3c8649d2a54986604b08c712625bd9468bf1549c')
sha1sums_x86_64=('884bc1cadf2cdafd17e6d10414361ccf56d2b0bd')

package() {
	tar xf data.tar.xz
	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/usr/lib/lantern/lantern.sh" "$pkgdir/usr/bin/lantern"
	install -Dm755 usr/lib/lantern/lantern-binary \
		"$pkgdir/usr/lib/lantern/lantern-binary"
	install -Dm755 usr/lib/lantern/lantern.sh \
		"$pkgdir/usr/lib/lantern/lantern.sh"
	install -Dm644 usr/share/applications/lantern.desktop \
		"$pkgdir/usr/share/applications/lantern.desktop"
	install -Dm644 usr/share/doc/lantern/changelog.Debian.gz \
		"$pkgdir/usr/share/doc/lantern/changelog.Debian.gz"
	install -Dm644 usr/share/doc/lantern/copyright \
		"$pkgdir/usr/share/doc/lantern/copyright"
	install -Dm644 usr/share/icons/hicolor/128x128/apps/lantern.png \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/lantern.png"
}
