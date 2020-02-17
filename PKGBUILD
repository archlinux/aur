# Maintainer: RedTide <redtid3@gmail.com>

pkgname=jacksettings
pkgver=0.1.0
pkgrel=1
_pkgname="${pkgname}-${pkgver}"
pkgdesc="JACK settings using jackd via systemd"
url="https://github.com/azdrums/${pkgname}"
arch=('x86_64')
license=('GPL2')
depends=('qt5-base' 'jack2' 'a2jmidid')
conflicts=('jacksettings-git')
source=("${_pkgname}.tar.gz"::"https://github.com/azdrums/jacksettings/archive/${pkgver}.tar.gz")
sha256sums=('a723e2a63d2de7b7fd5daf23b46b1f4c55697ace8658519060c6b0dc26344ad2')
build() {
	cd "${srcdir}/${_pkgname}"
	qmake PREFIX="/usr/" JACKSettings.pro
	make INSTALL_DIR=$pkgdir
}
package() {
	cd "${srcdir}/${_pkgname}"
	make INSTALL_ROOT=$pkgdir install
	install -Dm644 "${srcdir}/${_pkgname}/systemd/a2jmidi@.service" "${pkgdir}/usr/lib/systemd/user/a2jmidi@.service"
}
