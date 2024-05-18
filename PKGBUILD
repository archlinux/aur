# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.9.100
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://git.sr.ht/~mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus' 'scdoc')
depends=('dbus')
source=("${pkgname}-${pkgver}::https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c8c97dc2a4dae237854b59efbdf5689abd3d17e19e11983f0ffe0bed71e61279')
validpgpkeys=('2AEC637FA54CA7A0EBB1F2F170BC3F8784FBD057')

build() {
	cd "${pkgname}-v${pkgver}"
	make VERSION="${pkgver}-${pkgrel}" release
}

package() {
	cd "${pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	make CFALGS=-DDEBUG DESTDIR="${pkgdir}/" INSTALL_PREFIX="usr" install
}
