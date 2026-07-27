# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.2.12
pkgrel=2
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64' 'aarch64')
url="http://w1hkj.org"
license=('GPL-2.0-or-later')
depends=('cty' 'fltk' 'libsamplerate' 'flxmlrpc>=1.0.1' 'libsndfile'
         'portaudio' 'libpulse' 'libgpiod' 'hamlib' 'hamradio-menus')
optdepends=('pulseaudio: pulseaudio support')
source=(http://w1hkj.org/files/$pkgname/$pkgname-$pkgver.tar.gz
#	diff.wayland.fix)
	flarq.wayland.patch)

prepare () {
	cd $srcdir/$pkgname-$pkgver

#	patch -p0 < ../diff.wayland.fix
	patch -p0 < ../flarq.wayland.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver

	./configure --prefix=/usr \
		--enable-tls --with-flxmlrpc --without-asciidoc
#		--enable-tls --without-flxmlrpc --without-asciidoc
#			(^^^ temporary, until flxmlrpc is updated)
	make ASCIIDOC_ICONS_DIR=/etc/asciidoc/images/icons/
}

check() {
	cd "$srcdir"/$pkgname-$pkgver

	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('2138b4eff9cd51f7824b79e1b751da1c'
         'c180f454288d495ecbc65b364818530d')
sha256sums=('028bcb1c100cb790cad36324b8063c13594e160743f9378320ceabcf16dbc44a'
            '3bdbd3fe1b8d7864f46418606e1ab98ca45b48fecd2338a573074c4185dbf380')
