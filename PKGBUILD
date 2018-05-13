# Maintainer: lwsk <lwsk@protonmail.com>
pkgname=openleecher
pkgver=1.1
pkgrel=1
pkgdesc="Random internet browsing tool."
arch=('any')
url='https://openleecher.tk/'
license=('MIT')
depends=('python')
depends+=('pyqt5-common')
makedepends=('unzip')
makedepends+=('wget')
makedepends+=('python-pip')
backup=()
options=('!emptydirs')
source=()
md5sums=()

package() {
	pip install --upgrade termcolor -t $pkgdir/usr/lib/python3.6/site-packages/
	pip install --upgrade PyQt5 -t $pkgdir/usr/lib/python3.6/site-packages/
	pip install --upgrade psutil -t $pkgdir/usr/lib/python3.6/site-packages/
	pip install --upgrade pyinstaller -t $pkgdir/usr/lib/python3.6/site-packages/

	wget https://openleecher.tk/res/openleecher-1.1-src.zip
	unzip -o openleecher-1.1-src.zip -d $srcdir

	pyinstaller --paths=$pkgdir/usr/lib/python3.6/site-packages/ -F $srcdir/openleecher.py

	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/etc/openleecher/
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/icons/

	cp $srcdir/dist/openleecher $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin/openleecher

	cp $srcdir/config.ini $pkgdir/etc/openleecher/
    	chmod 776 $pkgdir/etc/openleecher/config.ini

 	cp $srcdir/openleecher.png $pkgdir/usr/share/icons/
	cp openleecher.desktop $pkgdir/usr/share/applications/

	cp LICENSE $pkgdir/etc/openleecher/
	cp $srcdir/x.png $pkgdir/etc/openleecher/
	cp $srcdir/pause.png $pkgdir/etc/openleecher/
	cp $srcdir/slider.gif $pkgdir/etc/openleecher/

	touch $pkgdir/etc/openleecher/openleecher.log
 	chmod 776 $pkgdir/etc/openleecher/openleecher.log
}
