# Maintainer: RedTide <redtid3@gmail.com>

pkgname=jacksettings
pkgver=v0.0.1.alpha.r0.g3e4500c
pkgrel=1
pkgdesc="JACK settings using jackd via systemd"
url="https://github.com/azdrums/${pkgname}"
arch=('x86_64')
license=('GPL2')
depends=('qt5-base' 'jack2')
optdepends=('a2jmidid: A daemon for exposing legacy ALSA sequencer applications in JACK MIDI system.')
makedepends=('git')
conflicts=('jacksettings-git')
source=("${pkgname}"::"git+https://github.com/azdrums/${pkgname}.git")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "${srcdir}/${pkgname}"
	qmake PREFIX="/usr/" JACKSettings.pro
	make INSTALL_DIR=$pkgdir
}
package() {
	cd "${srcdir}/${pkgname}"
	make INSTALL_ROOT=$pkgdir install
	install -Dm644 "${srcdir}/${pkgname}/systemd/a2jmidi@.service" "${pkgdir}/usr/lib/systemd/user/a2jmidi@.service"
}
