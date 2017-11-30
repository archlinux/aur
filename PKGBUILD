# Maintainer: Laurent Laffont <laurent.laffont@gmail.com>
# Maintainer: Benoit Verhaeghe <badetitou@gmail.com>


pkgname=pharo-launcher
pkgver=6.0
pkgrel=2
pkgdesc="Pharo Launcher helps you manage your Pharo images"
arch=(i686 x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo-project.org/"
license=('MIT')
makedepends=('gendesk')
depends=('pharo-spur-vm')

source=(
	'http://files.pharo.org/media/logo/icon-lighthouse-128x128.png'
	'http://files.pharo.org/platform/launcher/PharoLauncher-user-stable-2017.11.29.zip'
)

md5sums=(
	'dec67d08d24433696375a319de029f34'
	'517efcda60857206c7a81ecb0fe80b53'
)

prepare() {
	gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}


package() {
	cd $srcdir/

	mkdir -p $pkgdir/usr/share/pharo-launcher/
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/pixmaps/

	cp -f $srcdir/PharoLauncher.* $pkgdir/usr/share/pharo-launcher/
	chgrp -R users $pkgdir/usr/share/pharo-launcher/
	chmod -R 775 $pkgdir/usr/share/pharo-launcher/


	echo "/usr/bin/pharo-spur /usr/share/pharo-launcher/PharoLauncher.image" > $pkgdir/usr/bin/pharo-launcher
	chmod +x $pkgdir/usr/bin/pharo-launcher

	cp $srcdir/icon-lighthouse-128x128.png	$pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
