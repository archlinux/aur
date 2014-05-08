# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=bubblemon-dockapp
pkgver=1.46
pkgrel=3
pkgdesc="This is a system monitoring dockapp, visually based on the GNOME 'BubbleMon' applet"
arch=('i686' 'x86_64')
url="http://www.ne.jp/asahi/linux/timecop/"
license=('GPL')
depends=('gtk')
makedepends=('patch')
source=(http://www.ne.jp/asahi/linux/timecop/software/$pkgname-$pkgver.tar.gz \
	destdir.patch)


md5sums=('f1f86fe5c725bf3a6f5fef8709992931'
          '21a27b21b844d543e7320bffe1cae1af')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p0 < ../destdir.patch
	make || return 1
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin/"
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
	install -c README "$pkgdir/usr/share/doc/$pkgname/README"
}
