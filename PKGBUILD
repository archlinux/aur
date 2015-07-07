# Submitter: andre.laszlo
# Maintainer: jooch
# Contributors: Florian Dejonckheere <florian@floriandejonckheere.be>, Jooch <jooch (at) gmx (dot) com>

pkgname=live-usb-install
pkgver=2.5.9
pkgrel=1
pkgdesc="LiveUSB Install - Create bootable usb sticks from a wide range of different Linux distributions"
url="http://live.learnfree.eu"
license=('GPL')
arch=('i686' 'x86_64')
source=('http://skss.learnfree.eu/go.php?http://download.learnfree.eu/lfu-usb/live-usb-install-2.5.9.tar.gz'
	'live-usb-install.desktop')
md5sums=('e195f70162707c930d77a61a5ccc137d'
'3c0c278b60d2f6fe8887a94198b1796f')
depends=('python2'
	'pygtk'
	'libglade'
	'syslinux'
	'wget'
	'p7zip'
	'mtools'
	'unrar'
	'parted'
	'gksu'
	'python2-dbus')
optdepends=('python-libtorrent: needed for downloading some distributions')
conflicts=('live-usb-install<2.5.9')

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