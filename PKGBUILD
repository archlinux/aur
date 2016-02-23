# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.11.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('7e0eccc113a330c1016b14cd7cd1e17a')
sha256sums=('750742093c884c837182cf540d61d2efc0ce443f3ef8f3c27f3e74f9f754139d')
sha512sums=('0c082264cb1ad13ab0d6dc44b4f86152c487547dc31a0d98e72ba11db0232b04332736f2d0ffca28659f37186d51fe2c941bb41fee783f5f05242f9c3ac04f81')

build() {
	cd ./"${pkgname}-${pkgver}" || exit
	make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}" || exit
	mkdir -p "${pkgdir}"/usr/{share,bin}
	mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
	make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
	install  -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}
