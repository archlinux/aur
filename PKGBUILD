# Contributor: Dmitry Nosachev - quartz64 at gmail dot com
# Maintainer: N.Izumi - izmntuk
pkgname=smp_utils
pkgver=0.98
pkgrel=1
pkgdesc="Utilities for the Serial Attached SCSI (SAS) Management Protocol (SMP)"
arch=('i686' 'x86_64')
url="http://sg.danny.cz/sg/smp_utils.html"
license=('BSD')
depends=('glibc')
#options=('!libtool')
source=("http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz")
sha1sums=('2c8296b0dc1f131a59729f4a8e46306a2938ad77')
sha256sums=('e1e470d0b851bd1b1a1dae8d831d4c1f1a9a62bad9eb1966b870a20100b886cc')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --disable-static
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}"/usr/share/{licenses,doc}/"${pkgname}"
	install -pm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm644 AUTHORS ChangeLog COVERAGE CREDITS NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
