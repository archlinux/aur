pkgname=anbox-bridge
pkgver=1
pkgrel=1
pkgdesc="Script to enable network for anbox"
depends=('anbox-git')
arch=('x86_64')
url="https://anbox.io"
license=('custom')
source=("https://raw.githubusercontent.com/anbox/anbox/master/scripts/anbox-bridge.sh"
	"anbox-bridge.c"
	"anbox-bridge.desktop")
md5sums=('SKIP'
	'SKIP'
	'SKIP')
install="${pkgname}.install"

build() {
	cd "${srcdir}"
	gcc -o anbox-bridge ./anbox-bridge.c
}

package() {
	cd "${srcdir}"
	
	install -d "${pkgdir}/"usr/lib/anbox
	install -m755 anbox-bridge.sh "${pkgdir}/"usr/lib/anbox/
	
	install -d "${pkgdir}/"usr/bin
	install anbox-bridge "${pkgdir}/"usr/bin/
	
	chmod u+s "${pkgdir}/"usr/bin/anbox-bridge
	
	install -d "${pkgdir}/"usr/share/applications
	install -m644 anbox-bridge.desktop "${pkgdir}/"usr/share/applications/
}
