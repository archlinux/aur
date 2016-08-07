# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=t_test
pkgver=3.23.13
pkgrel=1
pkgdesc="This is a test fork package of FLDIGI - Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'libusb-compat')
optdepends=('hamlib: rig control through hamlib'
	'libsndfile: sound file support'
	'portaudio: PortAudio support'
	'pulseaudio: pulseaudio support'
	'xmlrpc-c: XML-RPC control')
source=(http://downloads.sourceforge.net/project/fldigi/fldigi/fldigi-$pkgver.tar.gz)
sha512sums=('a6deefcb0f11bd5e866cd363eff619e7aeace6a781a110aa36fb249612c5665353ecd21225b9ff15c8e7f9fdd4483a43b4f88dbcf7ff56325324eac70d164ad0')

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
