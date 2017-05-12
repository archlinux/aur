# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=fldigi
pkgver=4.0.4
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'libusb-compat' 'flxmlrpc')
optdepends=('hamlib: rig control through hamlib'
	'libsndfile: sound file support'
	'portaudio: PortAudio support'
  'pulseaudio: pulseaudio support')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('9629941f4e0ed43d99363e224184a2afa211294c2cf7964c3d6a4c53202cc0ca63c3b86c8a35065b84cfa3e7a61899e997a1d75fcf7821fba7900fa9585298f2')

build() {
	cd "$srcdir"

	#patch -p1 < cty.patch
	#patch -p1 < short.patch

	cd $pkgname-$pkgver

	./configure --prefix=/usr \
		--enable-tls --with-flxmlrpc
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
