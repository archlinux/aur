# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-aurora
pkgver=1.5.1
pkgrel=7
pkgdesc="gtk-engine: latest member of the clearlooks family"
arch=('x86_64')
url="http://www.gnome-look.org/content/show.php/Aurora+Gtk+Engine?content=56438"
license=('GPL')
depends=('gtk2')
makedepends=('pkgconfig')
replaces=('gtk-aurora-engine')
source=(https://dl.opendesktop.org/api/files/downloadfile/id/1460970469/s/398786048b91ec17599ae7c79cc780a1/t/1515614861/56438-aurora-$pkgver.tar.bz2)
md5sums=('5eeea57c5938306ad7ccfc7cd71d009d')

build() {
	cd "$srcdir"
	tar xzf aurora-gtk-engine-1.5.tar.gz -C "$srcdir"
	cd "$srcdir"/aurora-1.5
	./configure --prefix=/usr --enable-animation
	make
}

package() {
	cd "$srcdir"/aurora-1.5
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/usr/share/themes
	tar xjf ../Aurora.tar.bz2 -C "$pkgdir"/usr/share/themes
	chown -R root:root "$pkgdir"/usr/share/themes
}
