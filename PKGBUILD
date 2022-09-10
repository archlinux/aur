# Maintainer: Sick Codes <info at sick codes>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Wayne Hartmann (DH4) <wayne@bitstorm.pw>

pkgname=protocase-designer
pkgver=6.0
pkgrel=1
pkgdesc="The fastest and easiest way to design, price, and build custom electronics enclosures."
arch=('x86_64')
url="http://www.protocasedesigner.com/"
depends=('java-runtime-common')
#install=protocase-designer.install
license=('custom')
source=('https://www.protocasedesigner.com/RELEASE/ProtocaseDesigner-linux-beta.tar.gz'
	ProtocaseDesigner.desktop)
md5sums=('SKIP'
	 'SKIP')
         
package() {
	
	install -d $pkgdir/usr/local/lib/
	cp -R $srcdir/ProtocaseDesigner/ProtocaseDesigner $pkgdir/usr/local/lib
	install -d $pkgdir/usr/local/share/ProtocaseDesigner/
	cp -R $srcdir/ProtocaseDesigner/library  $pkgdir/usr/local/share/ProtocaseDesigner/
	install -d $pkgdir/usr/local/share/pixmaps/
	cp $srcdir/ProtocaseDesigner/Protocase-Designer.png $pkgdir/usr/local/share/pixmaps/Protocase-Designer.png

	install -d $pkgdir/usr/local/bin/
	echo '#/bin/sh' > $pkgdir/usr/local/bin/ProtocaseDesigner
	echo "install -d  ~/ProtocaseDesigner/" >> $pkgdir/usr/local/bin/ProtocaseDesigner
	echo "mkdir ~/ProtocaseDesigner/UserLibrary" >> $pkgdir/usr/local/bin/ProtocaseDesigner
	echo "LD_LIBRARY_PATH=/usr/local/lib/ProtocaseDesigner/:/usr/local/lib/ProtocaseDesigner/lib/:\ $LD_LIBRARY_PATH java -jar /usr/local/lib/ProtocaseDesigner/ProtocaseDesigner.jar >> ~/ProtocaseDesigner/error.log 2>&1" >> $pkgdir/usr/local/bin/ProtocaseDesigner
	chmod 755 $pkgdir/usr/local/bin/ProtocaseDesigner

	install -d $pkgdir/usr/local/share/applications/
	cp $srcdir/ProtocaseDesigner.desktop $pkgdir/usr/local/share/applications/ProtocaseDesigner.desktop
}
