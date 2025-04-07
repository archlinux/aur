# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=joymap
pkgver=0.5.9
pkgrel=1
pkgdesc='A linux userspace device driver that allows joystick events to be remapped.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/linuxjoymap'
license=('GPL-2.0-only')
depends=()
makedepends=()
source=(
	"$pkgname-$pkgver.tar.gz::${url}/files/$pkgname-${pkgver}.tar.gz/download"
	'joymap.service')
sha256sums=('a4c178eae4693e51c114b2a1f462bde33b822edb31de2495693be2940b0fd1e7'
            '1ad47b6830ed73000689bdc2663f56f3df111a29b64e39dfc3ccd2a0562af36a')

_srcdir="$pkgname-${pkgver}"

build() {
	cd "${_srcdir}"
	make
}

package() {
	install -Dm644 'joymap.service' -t "${pkgdir}/usr/lib/systemd/user"

	cd "${_srcdir}"
	install -Dm755 'loadmap' "${pkgdir}/usr/bin/joymap"
	install -Dm755 'reserve_js' "${pkgdir}/usr/bin/joymap-reserve_js"
	install -Dm755 'joymap_blocker.so' -t "${pkgdir}/usr/lib"
}
