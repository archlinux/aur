# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-sound-output-device-chooser-git
_gitname=gse-sound-output-device-chooser
pkgver=r122.bdc28ce
pkgrel=1
pkgdesc="Enable selection of sound source and sink devices."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
install=device-chooser.install
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	_extid="sound-output-device-chooser@kgshank.net"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
	cp -a "sound-output-device-chooser@kgshank.net" "${pkgdir}/usr/share/gnome-shell/extensions"

	install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas"
	cp -v "${_extid}/schemas/org.gnome.shell.extensions.sound-output-device-chooser.gschema.xml" \
		"${pkgdir}/usr/share/glib-2.0/schemas"
}
