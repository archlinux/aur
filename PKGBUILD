# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.9.95
pkgrel=2
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://git.sr.ht/~mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus' 'scdoc')
depends=('dbus')
source=("https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3da3da1c74f567e7f02ad3fe27cd33e66f5f1e9978ddf09b383e1c4f1c688593')
validpgpkeys=('2AEC637FA54CA7A0EBB1F2F170BC3F8784FBD057')

build() {
	cd "${pkgname}-v${pkgver}"
	make VERSION="${pkgver}-${pkgrel}" release
}

package() {
	cd "${pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	make DESTDIR="${pkgdir}/" INSTALL_PREFIX="usr" install
}
