# Contributor: Laurent Laffont <laurent.laffont@gmail.com>


pkgname=pharo-launcher
pkgver=4.0
pkgrel=2
pkgdesc="Pharo Launcher helps you manage your Pharo images"
arch=(i686 x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo-project.org/"
license=('MIT')
makedepends=('gendesk')
depends=('pharo-vm-latest')

source=(
	'http://files.pharo.org/media/logo/icon-lighthouse-128x128.png'
	'https://ci.inria.fr/pharo/view/Launcher/job/Launcher/PHARO=40,VERSION=stable,VM=vm,label=linux/49/artifact/PharoLauncher-user-stable-2015.04.20.zip'
)

md5sums=(
	'dec67d08d24433696375a319de029f34'
	'b1c4b91c000c6fe6aa5fa43c00288e58')

prepare() {
	gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}


package() {
	cd $srcdir/

	mkdir -p $pkgdir/usr/share/pharo-launcher/
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/pixmaps/

	cp -f $srcdir/PharoLauncher.* $pkgdir/usr/share/pharo-launcher/
	chgrp users $pkgdir/usr/share/pharo-launcher/PharoLauncher.changes
	chmod 775 $pkgdir/usr/share/pharo-launcher/PharoLauncher.changes

	echo "/usr/bin/pharo /usr/share/pharo-launcher/PharoLauncher.image" > $pkgdir/usr/bin/pharo-launcher
	chmod +x $pkgdir/usr/bin/pharo-launcher

	cp $srcdir/icon-lighthouse-128x128.png	$pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
