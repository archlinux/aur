# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=dict-jargon
pkgver=4.4.7
pkgrel=1
pkgdesc="A compendium of hacker slang illuminating many aspects of hackish tradition"
url="http://www.catb.org/jargon/"
arch=('any')
license=('Unlicense')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
provides=('dictd-jargon')
conflicts=('dictd-jargon')
# Install file from dict-gcide (https://aur.archlinux.org/cgit/aur.git/tree/dict-gcide.install?h=dict-gcide)
install="${pkgname}.install"
source=("http://www.catb.org/~esr/jargon/oldversions/jarg447.txt")
sha512sums=('4fe8c3a4b505ac936b61c46e4f7b8d0988a1a004ad187f53f16e7542b615c7cf551cf48a486454845c56fe5c036c8adc29eecb4610df9989caa1a761c6240c46')

prepare() {
    cd ${srcdir}
    dictfmt -j -u ${url} -s "Jargon File (${pkgver}, 29 Dec 2003)" jargon < jarg447.txt
    dictzip jargon.dict
}

package() {
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" jargon.{dict.dz,index}
}
