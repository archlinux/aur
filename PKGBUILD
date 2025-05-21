# Maintainer: Omar Pakker <omar.pakker@oracle.com>

pkgname=rhythmbox-plugin-rhythmboxfullscreen-git
pkgver=r73.5deb5d0
pkgrel=1
pkgdesc="A full screen window for Rhythmbox."
arch=('any')
url="https://github.com/benjaoming/rhythmbox-fullscreen"
license=('GPL2')
depends=('rhythmbox' 'python-cairo')
makedepends=('git')
provides=('rhythmbox-plugin-rhythmboxfullscreen')
conflicts=('rhythmbox-plugin-rhythmboxfullscreen')
options=('!emptydirs')
install=rhythmbox-plugin-rhythmboxfullscreen.install
changelog=
source=("git+https://github.com/benjaoming/rhythmbox-fullscreen.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/rhythmbox-fullscreen"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/rhythmbox-fullscreen"

	# Schema
	install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" "schema/org.gnome.rhythmbox.plugins.rhythmboxfullscreen.gschema.xml"
	
	# The plugin itself
	install -Dm644 -t "${pkgdir}/usr/lib/rhythmbox/plugins/RhythmboxFullscreen/" *.py 
	install -Dm644 "RhythmboxFullscreen.plugin3" "${pkgdir}/usr/lib/rhythmbox/plugins/RhythmboxFullscreen/RhythmboxFullscreen.plugin"
	# Assets
	install -Dm644 -t "${pkgdir}/usr/share/rhythmbox/plugins/RhythmboxFullscreen/ui/" "ui/"*
	install -Dm644 -t "${pkgdir}/usr/share/rhythmbox/plugins/RhythmboxFullscreen/img/" "img/"*
}
