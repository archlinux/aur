# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=lib32-agena-bin
pkgver=2.22.1
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=('x86_64')
url="http://agena.sourceforge.net"
license=('GPL')
depends=('lib32-libext' 'lib32-ncurses' 'lib32-readline')
provides=('agena' 'agena-editor')
conflicts=('agena' 'agena-editor')
source=("$pkgname-$pkgver.deb::https://master.dl.sourceforge.net/project/agena/Binaries/Agena%20$pkgver/agena-$pkgver-linux.i386.deb")
sha256sums=('bc4ca05db82ddbfaa5bf431ca92b38f68dd1864793741830a7983b1f80c40b58')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cd usr
	install -Dm 755 local/bin/agena{,edit} -t "$pkgdir/usr/bin/"
	install -Dm 644 local/lib/libagena.{a,so} -t "$pkgdir/usr/lib32/"
	install -Dm 644 agena/share/icons/agenasmall.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/agena.png"
	install -Dm 644 agena/share/icons/agena.png -t "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	install -Dm 644 agena/share/icons/agena64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/agena.png"
	install -Dm 644 agena/share/icons/agena128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/agena.png"

	ln -s /usr/lib32/libreadline.so.8 "$pkgdir/usr/lib32/libreadline.so.7"
	ln -s /usr/lib32/libreadline.so.8 "$pkgdir/usr/lib32/libreadline.so.6"
	ln -s /usr/lib32/libhistory.so.8 "$pkgdir/usr/lib32/libhistory.so.7"
	ln -s /usr/lib32/libncursesw.so "$pkgdir/usr/lib32/libncurses.so.5"
	ln -s /usr/lib32/libncursesw.so "$pkgdir/usr/lib32/libtinfo.so.5"
}
