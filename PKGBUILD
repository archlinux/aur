# Maintainer: Jakob Dübel <jkbd@posteo.de>
_pkgname=jack-midi-clock
pkgname=${_pkgname}-git
pkgver=0.4.3.r2.g554baec
pkgrel=2
pkgdesc="A utility to send MIDI Beat Clock pulses that follow the JACK Transport"
arch=('x86_64')
url="https://github.com/x42/jack_midi_clock"
license=('GPL2')
groups=()
depends=('jack')
makedepends=('git' 'pkg-config')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+https://github.com/x42/jack_midi_clock.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgname}"
	#patch -p1 -i "$srcdir/${pkgname}.patch"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

#check() {}

package() {
	cd "$srcdir/${_pkgname}"
	install -d ${pkgdir}/usr/lib/jack
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
