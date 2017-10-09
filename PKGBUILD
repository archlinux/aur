# Maintainer: <olegfink@gmail.com>

pkgname=irccloud
pkgver=0.4.0
pkgrel=2
pkgdesc="Chat on IRC from anywhere, and never miss a message"

arch=('arm' 'i686' 'x86_64')
license=('Apache')
url="http://irccloud.com"
depends=('electron')
makedepends=('npm')
source=("irccloud-${pkgver}.tar.gz::https://github.com/irccloud/irccloud-desktop/archive/v${pkgver}.tar.gz"
        "irccloud"
	"irccloud.desktop"
        "irccloud.png") 
sha256sums=('994edff685111359b51884cdf565fdfd1e47e08ab756217b9a6b366ad0932aee'
            '019f90a6bb3ec816a2ac8224b85792025e2885ef7cb451e2d2c70fdd68255acc'
            '2f58dd2b70e6867bfddc216c25f704c4ebd9a427bdcbe4de92b0a2ed06407569'
            'd95945490c9728dee963fd98b441293a1e6d664e7a760e610f4622239b26a4d8')

package(){
	cd "${srcdir}/irccloud-desktop-${pkgver}"
	npm install --production

	install -d "${pkgdir}/usr/lib/irccloud"
	cp -a package.json app node_modules "${pkgdir}/usr/lib/irccloud"
	install -Dm644 "${srcdir}/irccloud.desktop" "${pkgdir}/usr/share/applications/irccloud.desktop"
	install -Dm644 "${srcdir}/irccloud.png" "${pkgdir}/usr/share/pixmaps/irccloud.png"
	install -Dm755 "${srcdir}/irccloud" "${pkgdir}/usr/lib/irccloud/irccloud"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/irccloud/irccloud" "${pkgdir}/usr/bin/irccloud"
}
