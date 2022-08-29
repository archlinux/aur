
# Maintainer: W9HDG <travis@talenet.us
# Contributor: Wayne Lai <abev66@gmail.com>

pkgname="synochat"
pkgver="1.2.1_0207"
pkgrel="1"
pkgdesc="Synology Chat Client is the desktop client software of Synology Chat."
arch=('x86_64')
url="https://www.synology.com/dsm/feature/chat"
license=('non-free')
groups=('')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk2' 'scrot' 'alsa-lib' 'nss' 'libxtst' 'libxss' 'harfbuzz' 'pango')
source=(https://global.download.synology.com/download/Utility/ChatClient/1.2.1-0207/Ubuntu/x86_64/Synology%20Chat%20Client-1.2.1-0207.deb)
sha512sums=('e05929fce106aef8a52427df46861d29a0b0767e3cc1e4cebf5d60822d3f2ae04e1505700560ef7733683164ebe661c8e698d8e8165df6d5ddf37d2842c7eade')

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
