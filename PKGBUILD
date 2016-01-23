# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.9.1
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('f8a9c8558f44d7bd04d03bfe77588dfb')
sha256sums=('c444af1098cd57b50aebabc255799549f237cef3bc862673abe5f52350da6be8')
sha512sums=('dc45c6e4aafab7719598c37fc3046e6b93171023e8ad337d7795d56613a810fe06c1896a3fd5fd74b5874a2b9ca0f30282cafd611ededd065dec3296deeabab0')

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
