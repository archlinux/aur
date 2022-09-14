# Maintainer: Sick Codes <info@sick.codes>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Wayne Hartmann (DH4) <wayne@bitstorm.pw>

pkgname=protocase-designer
pkgver=6.0
pkgrel=2
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
	# new version uses a packaged JVM, ready for use
	install -d $pkgdir/usr/local/lib/
	install -d $pkgdir/usr/local/bin/
	install -d $pkgdir/opt/ProtocaseDesigner/
	install -d $pkgdir/usr/local/share/pixmaps/
	install -d $pkgdir/usr/local/share/applications/

	# copy everything to /opt/ProtocaseDesigner
	cp -R $srcdir/ProtocaseDesigner  $pkgdir/opt/

	# create the shortcut
	cp $srcdir/ProtocaseDesigner/ProtocaseDesigner.desktop $pkgdir/usr/local/share/applications/ProtocaseDesigner.desktop
	cp $srcdir/ProtocaseDesigner/Protocase-Designer.png $pkgdir/usr/local/share/pixmaps/Protocase-Designer.png

	# add a shell script to run said files
	echo '#/bin/sh' > $pkgdir/usr/local/bin/ProtocaseDesigner
	echo "install -d  ~/ProtocaseDesigner/" >> $pkgdir/usr/local/bin/ProtocaseDesigner
	echo "mkdir -p ~/ProtocaseDesigner/UserLibrary" >> $pkgdir/usr/local/bin/ProtocaseDesigner
	echo "LD_LIBRARY_PATH=/opt/ProtocaseDesigner/natives/occjava/linux-x86_64 /opt/ProtocaseDesigner/ProtocaseDesigner" >> $pkgdir/usr/local/bin/ProtocaseDesigner
	chmod +x $pkgdir/usr/local/bin/ProtocaseDesigner

	# make an alias protocase-designer
	ln -s $pkgdir/usr/local/bin/ProtocaseDesigner $pkgdir/usr/local/bin/protocase-designer

}
