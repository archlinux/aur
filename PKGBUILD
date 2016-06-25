# Maintainer: <olegfink@gmail.com>

pkgname=irccloud
pkgver=0.1.7
pkgrel=1
pkgdesc="Chat on IRC from anywhere, and never miss a message"

arch=('arm' 'i686' 'x86_64')
license=('Apache')
url="http://irccloud.com"
depends=('electron')
makedepends=('npm')
source=("https://github.com/irccloud/irccloud-desktop/archive/v${pkgver}.tar.gz"
        "irccloud"
	"irccloud.desktop"
        "irccloud.png") 
sha256sums=('d0ed98b94a735fd49f3ecf7767fd25dd1fba8770f11315ac1e8a67bc5d13dec3'
            '620a7208a4a0c0d79546079273e6d4297cd35da897995ca3c15f1c15970222a0'
            '2f58dd2b70e6867bfddc216c25f704c4ebd9a427bdcbe4de92b0a2ed06407569'
            'd95945490c9728dee963fd98b441293a1e6d664e7a760e610f4622239b26a4d8')

package(){
	install -d "${pkgdir}/usr/share/irccloud"
	cd "${srcdir}/irccloud-desktop-${pkgver}/app"
	cp -a . "${pkgdir}/usr/share/irccloud"
	npm install  --prefix="${pkgdir}/usr/share/irccloud" 

	install -Dm644 "${srcdir}/irccloud.desktop" "${pkgdir}/usr/share/applications/irccloud.desktop"
	install -Dm644 "${srcdir}/irccloud.png" "${pkgdir}/usr/share/pixmaps/irccloud.png"
	install -Dm755 "${srcdir}/irccloud" "${pkgdir}/usr/share/irccloud/irccloud"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/share/irccloud/irccloud" "${pkgdir}/usr/bin/irccloud"
}
