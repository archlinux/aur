# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# PKGBUILD based off of fldigi;
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-git
pkgver=4.2.00.r0.gb1d9024b
#v4.1.20.r0.gfeddecc7
pkgrel=4
pkgdesc="Digital Modem Program for Amateur Radio, git version"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'flxmlrpc>=1.0.1'
         'portaudio' 'libpulse' 'hamlib' 'hamradio-menus')
optdepends=(
	'libsndfile: sound file support'
	'pulseaudio: pulseaudio support'
	'asciidoc: build documentation with asciidoc')
provides=('fldigi')
conflicts=('fldigi')
source=("$pkgname::git+https://git.code.sf.net/p/fldigi/fldigi")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	autoreconf -i
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
