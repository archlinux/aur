# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-launcher-bin
pkgver=10.1.1
pkgrel=1
pkgdesc="Launcher for BlueMaxima's Flashpoint with script to install data files"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('MIT')
depends=('nss>=3.0'
				 'php'
				 'gtk3'
				 'libxss'
				 'wine'
				 'flashpoint-data-files-installer')
optdepends=('flashplayer-standalone: native Flash support')
conflicts=('flashpoint-bin' 'flashpoint-launcher-git')
source=("https://github.com/FlashpointProject/launcher/releases/download/${pkgver}/Flashpoint-${pkgver}_linux-amd64.deb")
sha512sums=('dccc405a8f059887ef5f49b94a94e00e7bd87bf6f12922ffdac301d8339ffe96f482fab53d822cd47c222e5ad4151e8abbc832615525939770229d155c21dd78')

package(){
	echo Extracting package data ..
	tar xf data.tar.xz -C ${pkgdir} -v

	# Symlink to binary
	install -d $pkgdir/usr/bin/
	ln -sfv /opt/Flashpoint/flashpoint-launcher $pkgdir/usr/bin/flashpoint-launcher

	# License
	install -dv $pkgdir/usr/share/licenses/
	cp -rv $pkgdir/opt/Flashpoint/licenses/ $pkgdir/usr/share/licenses/Flashpoint

	# Make config and preferences writable by all
	touch "${pkgdir}/opt/Flashpoint/config.json"
	chmod 666 "${pkgdir}/opt/Flashpoint/config.json"
	touch "${pkgdir}/opt/Flashpoint/preferences.json"
	chmod 666 "${pkgdir}/opt/Flashpoint/preferences.json"
	touch "${pkgdir}/opt/Flashpoint/launcher.log"
	chmod 666 "${pkgdir}/opt/Flashpoint/launcher.log"
}
