# Maintainer: Mikhail Artamonov <maximalis171091@yandex.ru>
# makepkg --printsrcinfo > .SRCINFO && makepkg -scC --nocheck --skipchecksums --skipinteg --skippgpcheck

pkgname=dmde-linux
pkgver=4.0.6.806
pkgrel=1
pkgdesc="DMDE is a powerful tool for data searching, editing, and recovery on disks"
arch=('x86_64')
url="https://dmde.ru/"
license=('custom')
depends=(zenity sudo)
makedepends=(unzip)
replaces=($pkgname)

source_x86_64=("https://dmde.ru/download/dmde-4-0-6-806-lin64-gui.zip")

source=(dmde-linux.desktop
		logo.png
		dmde-start.sh)

sha512sums=('3a4718b824861ea8a72a93cc7ae66828e5160d3642331e1b8f1d299affcfdd71f32d521521abdceda6c31a58830e6808c815c1edb0eb77fda1b9d162223d1dc2'
			'c32bbbb33b629b1953077fe9669a451c0adc308f94ce42c21e319ffe776695cb55c4d23831724186f966922a9fea073f8e65bb1f9a73afb5cb2e8075a0e5ebfe'
			'3ae42d333b768e0d761601a1bc8d85a785056e7a2a943394bee9be3de210c4033ceb5bf48660d2a13b0f67f9b54990c14db9d8fc6e18b462cbf95f496e95ff7a')

sha512sums_x86_64=('b2d20d13ced8780baa46a435c772af16b7b16b38c7daf65d2edc55f3560bb2ab417390ffd55cea6f424d4237ff911baa5547a45a9c9e279689fb1fd8fb82fc99')

package() {
	cd $srcdir
	mkdir -p ./usr/share/dmde-linux/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	unzip ./dmde-4-0-6-806-lin64-gui.zip -d $srcdir/usr/share/dmde-linux/
	cp -r usr $pkgdir
	chmod +x $pkgdir/usr/share/dmde-linux/dmde
	chmod +x $pkgdir/usr/share/dmde-linux/dmde-su
	install -vDm644 $srcdir/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	chmod +x $pkgdir/usr/share/applications/$pkgname.desktop
	install -vDm644 $srcdir/dmde-start.sh $pkgdir/usr/share/dmde-linux/dmde-start.sh
	chmod +x $pkgdir/usr/share/dmde-linux/dmde-start.sh
	ln -sr /usr/share/dmde-linux/dmde-start.sh $pkgdir/usr/bin/dmde
}
