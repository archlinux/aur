# Maintainer: xeyqe <xeyqe@seznam.cz>

pkgname='blackarch-menus-extended'
pkgver='0.2'
pkgrel=1
groups=('blackarch')
pkgdesc="BlackArch specific XDG-compliant menu with more desktop files."
arch=('any')
url="https://drive.google.com/file/d/0B_PopwyKmOH9MDM3M2xFbVdmRmc/view"
license=('GPL')
depends=('xdg-utils')
conflicts=('blackarch-menus')
source=('https://drive.google.com/uc?export=download&id=0B_PopwyKmOH9MDM3M2xFbVdmRmc')
md5sums=('b941bb4e4b9eda858f6ae699162245fe')

prepare() {
	wget "https://raw.githubusercontent.com/BlackArch/blackarch-iso/master/tools/menu-maker/help-flags.txt"
	bash blackarch-directory.sh
	bash X-BlackArch.sh
	bash blackarch_desktop_files.sh
}

package() {
	install -m755 -d "${pkgdir}/etc/xdg/menus/applications-merged"
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m755 -d "${pkgdir}/usr/share/desktop-directories"

	install -m644 X-BlackArch.menu "${pkgdir}/etc/xdg/menus/applications-merged/"
	install -m644 *.directory "${pkgdir}/usr/share/desktop-directories/"
	install -m644 *.desktop "${pkgdir}/usr/share/applications/"
}