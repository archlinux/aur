# Maintainer: xeyqe <xeyqe@seznam.cz>

pkgname='blackarch-menus-extended'
pkgver='0.2'
pkgrel=2
pkgdesc="BlackArch specific XDG-compliant menu with more desktop files."
arch=('any')
url="https://github.com/BlackArch/blackarch/tree/master/packages/blackarch-menus"
license=('GPL')
depends=('xdg-utils')
conflicts=('blackarch-menus')
source=('https://drive.google.com/uc?export=download&id=0B_PopwyKmOH9WTNLX2o3WUxHMnc')
md5sums=('db27d8b60ab6a8ada62fae66b5836d45')

prepare() {
	cd desktop_files
	wget "https://raw.githubusercontent.com/BlackArch/blackarch-iso/master/tools/menu-maker/help-flags.txt"
	
	bash blackarch-directory.sh
	bash X-BlackArch.sh
	#bash blackarch_desktop_files.sh
}

package() {
	install -m755 -d "${pkgdir}/etc/xdg/menus/applications-merged"
	install -m755 -d "${pkgdir}/usr/local/bin"
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m755 -d "${pkgdir}/usr/share/desktop-directories"

	install -m644 desktop_files/X-BlackArch.menu "${pkgdir}/etc/xdg/menus/applications-merged/"
	install -m755 desktop_files/appHelper.sh "${pkgdir}/usr/local/bin"
	install -m644 desktop_files/*.desktop "${pkgdir}/usr/share/applications/"
	install -m644 desktop_files/*.directory "${pkgdir}/usr/share/desktop-directories/"
}