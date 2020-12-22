# Submitter: andre.laszlo
# Maintainer: Jooch <jooch (at) gmx (dot) com
# Contributors: Florian Dejonckheere <florian@floriandejonckheere.be>, Jooch <jooch (at) gmx (dot) com>

pkgname=live-usb-install
pkgver=2.5.12
pkgrel=1
pkgdesc="LiveUSB Install - Create bootable usb sticks from a wide range of different Linux distributions"
url="http://live.learnfree.eu"
license=('GPL')
arch=('i686' 'x86_64')
depends=(python2 pygtk libglade syslinux wget p7zip mtools unrar parted gksu python2-dbus)
optdepends=('python-libtorrent: needed for downloading some distributions')
conflicts=('live-usb-install')
install=live-usb-install.install
source=("http://downloads.sourceforge.net/project/liveusbinstall/live-usb-install-$pkgver.tar.gz"
		live-usb-install.desktop)
sha256sums=('dc1d167b6a5aa60d565fb947cd2cea1aef5a854bc3d788732a67ca84617024ed'
			'31b360564048282357bb5b2a037ac2d6b884669ed737dfa9480ff23d3cff9c4d')


package(){
	cd ${srcdir}/${pkgname}

	# Python2 hack
	sed -i 's!#\!/usr/bin/env python!#\!/usr/bin/env python2!g' live-usb-install.py

	mkdir -p ${pkgdir}/usr/share/{${pkgname},pixmaps,applications}
	
	install -Dm644 appversion.py\
		asubprocess.py\
		live-usb-install.py\
		live-usb-install.glade\
		logo.png\
			${pkgdir}/usr/share/${pkgname}
	cp -r presets\
		pyudev\
		locale\
		syslinux\
		templates\
		wingrub\
			${pkgdir}/usr/share/${pkgname}
	install -Dm644 logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

	install -Dm644 ${srcdir}/live-usb-install.desktop ${pkgdir}/usr/share/applications/
}
