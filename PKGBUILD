
# Maintainer: W9HDG <travis@talenet.us>
# Co-Maintainer: stanis64 <info@sf-it.cz>
# Contributor: Wayne Lai <abev66@gmail.com>

pkgname="synochat"
pkgver="1.2.2_0222"
pkgrel="1"
pkgdesc="Synology Chat Client is the desktop client software of Synology Chat."
arch=('x86_64')
url="https://www.synology.com/dsm/feature/chat"
license=('non-free')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk2' 'scrot' 'alsa-lib' 'nss' 'libxtst' 'libxss' 'harfbuzz' 'pango')
source=(https://global.download.synology.com/download/Utility/ChatClient/1.2.2-0222/Ubuntu/x86_64/Synology%20Chat%20Client-1.2.2-0222.deb)
sha512sums=('5f2f5c6bb27111df23115a76702d5e72d4975466a71e0416c434ad9d41c024e60afcdb49b442c7e0b6715a762d533bd8a944fb4b61b05a42af57feb849d440f0')

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
