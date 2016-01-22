# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.9.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse attr)
options=(!emptydirs)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('12fed26ce2c5c6c0e183b8e9ec23a7f5')
sha256sums=('eeeb1ee39c5f17c93d1fdc798a76e025f650f46f432d2938f1fb2c1cfc630f7c')
sha512sums=('ba4e642dcd26edbe4403227daf6703b601007916fc5ecafecea8e510f4d02d1a3a636c55a708cc32897f7021b7fe6aeabd5f15eb91826e1e8b699b39390dc3dc')

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
