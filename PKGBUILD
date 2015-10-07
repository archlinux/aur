# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=grubinvaders
pkgver=1.0.0
pkgrel=4
pkgdesc='multi boot compliant game for i386 and compatible x86_64'
arch=('any')
url="http://www.erikyyy.de/invaders/"
license=('GPL2')
install=${pkgname}.install
source=("http://www.erikyyy.de/invaders/invaders-${pkgver}.tar.gz"
	'01-misspelling-loose.patch'
	'01-uint8-char.patch'
	'02-build-flags.patch'
	'02-static-inline.patch'
	'03-reboot-on-esc.patch'
	'04-change-colors.patch'
	'05-pause.patch'
	'grub')
sha256sums=('304c8b0f82eaec54b07250b0f39886e1d9fa23c48075213bf87c8f375781a845'
            '02c0a9aa07afaec24af8537850251a1575616547bc760da37308974f90041864'
            '6791e4ff7b1b4c3f8989fcc1565d9ebc2c47e18506a3db283f852ff6cf8f9fd7'
            '0c251e0fba59b9aa548638f145d495ee67e69189a396c1c95b39081a26ac580c'
            '4e3f542e8518b091cf97051468dc3f29cbb304162d60fd892108cf3d8c0f868b'
            'eb3414a8b31cd26c5091847a52667903e47056f23ba1a5415ab7568a3f2f6bc5'
            'fcea5bc771589d83441d8df44329aa0aa5ff8a987813f44a76a3314714f3a60e'
            'dc102190cc815aff769bf3b5d56a4304c972bea647feb9e2e64c63661cfd123b'
            'de564857bd69cb5680aa994bcd8b9119bcdb7d07fade0a4df4db950c871830f5')

prepare() {
	cd ${srcdir}/invaders/

	patch -Np1 -i "${srcdir}/01-misspelling-loose.patch"
	patch -Np1 -i "${srcdir}/01-uint8-char.patch"
	patch -Np1 -i "${srcdir}/02-build-flags.patch"
	patch -Np1 -i "${srcdir}/02-static-inline.patch"
	patch -Np1 -i "${srcdir}/03-reboot-on-esc.patch"
	patch -Np1 -i "${srcdir}/04-change-colors.patch"
	patch -Np1 -i "${srcdir}/05-pause.patch"
}

build() {
	cd ${srcdir}/invaders/

	./compile.sh
}

package() {
	cd ${srcdir}/invaders/

	install -m0644 -D ${srcdir}/invaders/invaders ${pkgdir}/boot/${pkgname}/invaders.bin
	install -m0755 -D ${srcdir}/grub ${pkgdir}/etc/grub.d/50_grubinvaders
}

