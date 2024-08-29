# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=1.0.0
pkgrel=1
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://git.sr.ht/~mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus' 'scdoc')
depends=('dbus')
source=("${pkgname}-${pkgver}::https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('098f56b8b7eebe17d337f0ccb416ac00e44b72ff00c507fe14c841d251ca0503')
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
