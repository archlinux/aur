# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.10.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('bcea7b89894abf8bbe4f8d96ad11071e')
sha256sums=('3d468865d578031c07299c06525807e1dd24bd2c6551d090e36f397b66b3a3be')
sha512sums=('9ec4945385e88b0b6980caa1003f5c2e4d33a6fb04aec1b43b4c4f4049be33ea58b92b6e8b104b9d62ed75635ae96599603870b27d831620961b71f87459bb73')

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
