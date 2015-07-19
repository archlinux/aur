# Maintainer: thr <r at sledinmay dot com>
pkgname=kiba-dock-bin
pkgver=0.1
pkgrel=1
pkgdesc="An eyecandy'd physics-based application launcher. (binary version)"
arch=(i686 x86_64)
url="https://launchpad.net/kiba-dock"
license=(GPL)
depends_i686=('gconf' 'orbit2' 'librsvg' 'libglade' 'glitz' 'libcanberra' 'zenity' 'gnome-python' 'python2-egg')
depends_x86_64=('lib32-gconf' 'lib32-orbit2' 'lib32-librsvg' 'lib32-libglade' 'lib32-glitz' 'lib32-libcanberra' 'zenity' 'gnome-python' 'python2-egg')
install=$pkgname.install
source=("https://downloads.sourceforge.net/project/junkyard/Kiba-Dock/kiba-dock_0.1-1.2_i386.deb" kiba-start)
md5sums=('2c39a4062dccf7cbe16351ef392ce622'
         'c2f00e6dabf2b5b29a973785c04ef863')

prepare() {
	tar -zxf data.tar.gz
	rm usr/bin/populate-dock.sh
	sed -i '0,/python/s//python2/' usr/bin/kiba-*.py
	sed -i '0,/kiba-dock/s//kiba-start/' usr/share/applications/kiba-dock.desktop
	mv usr/lib/python2.4 usr/lib/python2.7
	ln -s /usr/share/icons/hicolor/16x16/apps/kiba_16.png usr/share/kiba-dock/kiba_16.png
}
package() {
	cp -rf usr ${pkgdir}
	install kiba-start ${pkgdir}/usr/bin/
}
