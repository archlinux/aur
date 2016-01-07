# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=fldigi
pkgver=3.23.07.11
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'libusb-compat')
optdepends=('hamlib: rig control through hamlib'
	'libsndfile: sound file support'
	'portaudio: PortAudio support'
	'pulseaudio: pulseaudio support'
	'xmlrpc-c: XML-RPC control')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('fb5e68459e37c5aa20ea3b264ee2a8885c73127d9fdb9084129137b462f5f6c9836c04a12e947cdb9d7ce49435f6acb472519d744100dba4c524da2a9cce01c7')

build() {
	cd "$srcdir"

	#patch -p1 < cty.patch
	#patch -p1 < short.patch

	cd $pkgname-$pkgver

	./configure --prefix=/usr \
		--enable-tls
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
