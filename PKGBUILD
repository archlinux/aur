# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=wumwum
pkgver=0.9
pkgrel=2
pkgdesc="The Window Manager manager. It can turn emwh compliant window managers into a tiling window manager while retaining all initial functionalities. "
arch=('i686' 'x86_64')
url="http://wumwum.sourceforge.net/"
license=('GPLv3')
depends=('wmctrl' 'libaosd' 'libx11' 'xorg-utils')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz
	$pkgname.sh)

md5sums=('a2bcc7c22a7f2083cbda0d5e00849cc0'
         '21b18364ec9e6d0ec580329fb483cc29')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	perl Makefile.PL
	make
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install || return 1
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
