# Contributer: Julian Daube <joposter (at) gmail (dot) com>

pkgname=necta-wifi-mouse
pkgdesc="wifi mouse for android (server part)"
pkgver=1.0.2
pkgrel=1
arch=("x86_64" "i686")
url=http://wifimouse.necta.us/

license=("GPL2")
source=("icon.png")
source_x86_64=("mouseserver.deb::http://wifimouse.necta.us/apk/mouseserver-64.deb")
source_i686=("mouseserver.deb::http://wifimouse.necta.us/apk/mouseserver-32.deb")

depends=() 
makedepends=("sed" "tar")

prepare() {
	# extract data portion of deb file
	tar -xf "$srcdir/data.tar.gz"	
}

package() {
	# create destination directories
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/mouseserver/icons"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
	
	# install files
	install -m 775 "$srcdir/usr/sbin/mouseserver" "$pkgdir/usr/bin"
	install -m 664 "$srcdir/usr/share/applications/mouseserver.desktop" "$pkgdir/usr/share/applications/mouseserver.desktop"
	install -m 664 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mouseserver.png"
	install -m 644 -D "$srcdir/usr/share/mouseserver/icons/"* "$pkgdir/usr/share/mouseserver/icons"

	# modify desktop file
	desktopfile="$pkgdir/usr/share/applications/mouseserver.desktop"
	sed -i 's/Exec=.*$/Exec=\/usr\/bin\/mouseserver/'                                       "$desktopfile"
	sed -i 's/Icon=.*$/Icon=\/usr\/share\/icons\/hicolor\/128x128\/apps\/mouseserver.png/' "$desktopfile"
}


md5sums=('671cbe35275357e3a42aa118a7e35a8f')
md5sums_x86_64=('2db5e825e61be4c3d8f391e978b75cd3')
md5sums_i686=('125a616a9af78a9a6552ec49e8f32571')
