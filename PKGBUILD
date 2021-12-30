# Maintainer: Your Name <Alinajafian81@gmail.com>


pkgname=rutilt-bin
pkgver=0.18.0
pkgrel=6
pkgdesc="a Gtk+ program designed to set up any wireless network interface, find and connect to networks in range and get some information such as the quality of association etc that is primally written for Ralink devices"
arch=('x86_64' 'i386')
url=""
license=('GPL')
depends=('gtk2')
makedepends=()
provides=(rutilt-bin)
conflicts=(rutilt-bin)
options=('!strip')

source_x86_64=( "http://cz.archive.ubuntu.com/ubuntu/pool/universe/r/rutilt/rutilt_0.18-0ubuntu7_amd64.deb" 
		  			"rutilt.desktop")
source_i386=( "http://cz.archive.ubuntu.com/ubuntu/pool/universe/r/rutilt/rutilt_0.18-0ubuntu7_i386.deb" 
				 	"rutilt.desktop")


sha256sums_x86_64=('3ea81728d1d5412adba7cdbdbe7a1dfc6214f7ee25c36cb87b2e1e0d478db781' 'SKIP')
sha256sums_i386=('SKIP' 'SKIP')

prepare()
{
	cd $srcdir
	tar -xf data.tar.xz
}


package() 
{
	cd "$srcdir"
	
	install -d $pkgdir/usr/
	cp -r $srcdir/usr/share $pkgdir/usr/
	
	# I disabled the theme integration because this is an old app and does not work with new gtk3/4 apps.
	rm $pkgdir/usr/share/applications/rutilt.desktop
	cp $srcdir/rutilt.desktop $pkgdir/usr/share/applications/
	
	install -d $pkgdir/usr/bin/
	install -Dm755 $srcdir/usr/bin/rutilt $pkgdir/usr/bin/rutilt
	install -Dm755 $srcdir/usr/bin/rutilt_helper $pkgdir/usr/bin/rutilt_helper
	
	echo done
}
