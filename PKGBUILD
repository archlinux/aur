
# Maintainer: W9HDG <travis@talenet.us>
# Co-Maintainer: stanis64 <info@sf-it.cz>
# Contributor: Wayne Lai <abev66@gmail.com>

pkgname="synochat"
pkgver="1.2.3_0232"
pkgrel="1"
pkgdesc="Synology Chat Client is the desktop client software of Synology Chat."
arch=('x86_64')
url="https://www.synology.com/dsm/feature/chat"
license=('non-free')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'scrot' 'alsa-lib' 'nss' 'libxtst' 'libxss' 'harfbuzz' 'pango')
optdepends=('libappindicator-gtk2' 'libappindicator-gtk3')
source=(https://global.synologydownload.com/download/Utility/ChatClient/1.2.3-0232/Ubuntu/x86_64/Synology%20Chat%20Client-1.2.3-0232.deb)
sha512sums=('f94117ef8b3bb299d96fbce6f7b802ae18cd436176502ea13864c79cc086169671ac6154901d3fd7ae57de11ddfa177d4bf148ae99bbd33963e3ec5317f2e4ef')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	ls "${pkgdir}"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	ln -s '/opt/Synology Chat/synochat' '/usr/bin/synochat'
	update-desktop-database -q
}

post_upgrade() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	ln -sf '/opt/Synology Chat/synochat' '/usr/bin/synochat'
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	rm -f '/usr/bin/synochat'
	update-desktop-database -q
}
