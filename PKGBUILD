# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# PKGBUILD based off of fldigi

pkgname=fldigi-git
pkgver=v3.23.09.r0.g8446e6e
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio, git version"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('fltk' 'libusb-compat')
optdepends=('hamlib: rig control through hamlib'
	'libsndfile: sound file support'
	'portaudio: PortAudio support'
	'pulseaudio: pulseaudio support'
	'xmlrpc-c: XML-RPC control')
makedepends=('gcc'
	'autoconf'
	'libsamplerate'
	'libpng')
provides=('fldigi')
conflicts=('fldigi')
source=("$pkgname::git://git.code.sf.net/p/fldigi/fldigi")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	autoreconf -i
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make ASCIIDOC_ICONS_DIR=/etc/asciidoc/images/icons/
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
