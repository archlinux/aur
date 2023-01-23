# Maintainer: maximalisimus

pkgname=dmde-linux
pkgver=4.0.0.800
pkgrel=1
pkgdesc="DMDE is a powerful tool for data searching, editing, and recovery on disks"
arch=('x86_64')
url="https://dmde.ru/"
license=('custom')
depends=(zenity sudo)
makedepends=(unzip)
replaces=($pkgname)

source_x86_64=("https://dmde.ru/download/dmde-4-0-0-800-lin64-gui.zip")

source=(dmde-linux.desktop
		logo.png
		dmde-start.sh)

sha512sums=('3a4718b824861ea8a72a93cc7ae66828e5160d3642331e1b8f1d299affcfdd71f32d521521abdceda6c31a58830e6808c815c1edb0eb77fda1b9d162223d1dc2'
			'c32bbbb33b629b1953077fe9669a451c0adc308f94ce42c21e319ffe776695cb55c4d23831724186f966922a9fea073f8e65bb1f9a73afb5cb2e8075a0e5ebfe'
			'aea5752a3a3511d4dae425fee3bf1e3d2e888dd9c4d045ed8d2725c454ce583e63db6aeac76e5d06395c2e18667368a400a05cffeacad86c151f3a9747b9b635')

sha512sums_x86_64=('9a0dbd5f019067576738a03f26eb63a6bad31f5677d37c71281535315fe30acb93586855afa4f965b8d45b975b00c0889a380a55d595cb9506333a984de65b45')

package() {
	cd $srcdir
	mkdir -p ./usr/share/dmde-linux/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/pixmaps/
	unzip ./dmde-4-0-0-800-lin64-gui.zip -d $srcdir/usr/share/dmde-linux/
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
