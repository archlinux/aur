# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=dhcpdump
pkgver=1.8
pkgrel=2
pkgdesc='Parse DHCP packets'
arch=('x86_64' 'i686')
url='http://www.mavetju.org/unix/general.php'
license=('BSD')
depends=('libpcap')
source=("http://www.mavetju.org/download/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-includes.patch")
sha512sums=('52cd63d581a3c530c2f5baa66808d5b0241853651c720bd513b769b8301b4dff9c87243787014aea98a5b3ebed86ec317b58d262bf5031015141a4da50fb76e6'
            'cbbc96eb2840e6dae4cbcd7e2ef798d81aa03c0cb5dc7e238801af9e667878b3b52389442386a8df24e6219e75f25508176fd4fa3d83b3ed99c00aa34afb071f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p0 -i "../${pkgname}-${pkgver}-includes.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
