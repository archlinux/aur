# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-aurora
pkgver=1.5.1
pkgrel=8
pkgdesc="gtk-engine: latest member of the clearlooks family"
arch=('x86_64')
url="https://launchpad.net/ubuntu/+source/gtk2-engines-aurora/1.5.1-4"
license=('GPL')
depends=('gtk2')
makedepends=('pkgconfig')
replaces=('gtk-aurora-engine')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/gtk2-engines-aurora_$pkgver.orig.tar.gz 
https://launchpad.net/ubuntu/+archive/primary/+files/gtk2-engines-aurora_$pkgver.orig-Aurora.tar.bz2)

sha256sums=('d001b521449ecb16913afb894561a04473c75cfd942b029bb405e31ed00b6aaf'
'a65162c0aee60206be3785ce8532d71e0a6c0caff4e5de2971111015b3045597' )

build() {
	cd "$srcdir"
	tar xzf gtk2-engines-aurora_$pkgver.orig.tar.gz -C "$srcdir"
	cd "$srcdir"/aurora-1.5
	./configure --prefix=/usr --enable-animation
	make
}

package() {
	cd "$srcdir"/aurora-1.5
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/usr/share/themes
	tar xjf ../gtk2-engines-aurora_$pkgver.orig-Aurora.tar.bz2 -C "$pkgdir"/usr/share/themes
	chown -R root:root "$pkgdir"/usr/share/themes
}
