# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=fldigi
pkgver=3.23.07.10
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
sha512sums=('8ad30d8cdda55e4be783aa058f85ae9089b4bc7d1f5f8d12dd203ca085ea0347720bfeff5d4545867cdc916e04208c0437de1cb5833a0a5da36ef5bc00dae9fc')

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
