# Maintainer: <olegfink@gmail.com>

pkgname=irccloud
pkgver=0.1.6
pkgrel=1
pkgdesc="Chat on IRC from anywhere, and never miss a message"

arch=('arm' 'i686' 'x86_64')
license=('MIT')
url="http://irccloud.com"
depends=('electron')
makedepends=('gendesk' 'npm')
source=("https://github.com/irccloud/irccloud-desktop/archive/v${pkgver}.tar.gz"
        "irccloud"
        "irccloud.png") 
sha256sums=('68cfe0d245bd708054aa0c38d43cbdb56631f092bcae9c1ebf0aa50ddf4acd28'
            '620a7208a4a0c0d79546079273e6d4297cd35da897995ca3c15f1c15970222a0'
            'd95945490c9728dee963fd98b441293a1e6d664e7a760e610f4622239b26a4d8')

package() {
	gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name IRCCloud --categories Network 
	install -d "${pkgdir}/usr/share/irccloud"
	cp -a "${srcdir}/irccloud-desktop-${pkgver}/app/." "${pkgdir}/usr/share/irccloud"
	npm install  --prefix="${pkgdir}/usr/share/irccloud" configstore
#	find "${pkgdir}" -type d -exec chmod 755 {} +
#	find "${pkgdir}" -type f -exec chmod 644 {} +

	install -Dm644 "${srcdir}/irccloud.desktop" "${pkgdir}/usr/share/applications/irccloud.desktop"
	install -Dm644 "${srcdir}/irccloud.png" "${pkgdir}/usr/share/pixmaps/irccloud.png"
	install -Dm755 "${srcdir}/irccloud" "${pkgdir}/usr/share/irccloud/irccloud"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/share/irccloud/irccloud" "${pkgdir}/usr/bin/irccloud"
}
