# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=fldigi
pkgver=4.0.13
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'libusb-compat' 'flxmlrpc' 'portaudio')
optdepends=('hamlib: rig control through hamlib'
	'libsndfile: sound file support'
  'pulseaudio: pulseaudio support')
source=(http://w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('e5a74da404657356663dd5c115572efcf6525fb8851f5b6e9efc49c042d281d9cbf163ac99ee63396cb08737a5ae9223c1c985d72483b7031b5003174ac80d0d')

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
