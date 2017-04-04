# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# PKGBUILD based off of fldigi

pkgname=fldigi-git
pkgver=v4.0.1.r0.g476ff68e
pkgrel=2
pkgdesc="Digital Modem Program for Amateur Radio, git version"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('fltk' 'libsamplerate' 'libusb-compat')
optdepends=('hamlib: rig control through hamlib'
	'libsndfile: sound file support'
	'portaudio: PortAudio support'
	'pulseaudio: pulseaudio support'
	'flxmlrpc: external flxmlrpc library support'
	'asciidoc: build documentation with asciidoc')
provides=('fldigi')
conflicts=('fldigi')
source=("$pkgname::git+https://git.code.sf.net/p/fldigi/fldigi")
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
