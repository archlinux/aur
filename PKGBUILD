pkgname=lantern
pkgver=2.0.0+stable
pkgrel=1
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the
open Internet.'
arch=('i686' 'x86_64')
url='https://getlantern.org/'
license=('custom')
# I got it by ldd the lantern-binary as deb metadata doesn't provides it.
# And remove duplicated, like atk required by gtk3
depends=('gtk3' 'bzip2' 'dbus' 'glib2' 'dbus' 'libappindicator-gtk3' 'xcb-util'
	 'zlib' 'mesa')

source_i686=("https://s3.amazonaws.com/lantern/lantern-installer-beta-32-bit.deb")
source_x86_64=("https://s3.amazonaws.com/lantern/lantern-installer-beta-64-bit.deb")

md5sums_i686=('457bdc53ebe06759c271382b63407d6d')
md5sums_x86_64=('4bc31f5bd94d71bad9747e3623c9e2f6')

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
