# Maintainer: dobo <dobo90_at_gmail.com>

pkgname=dextools
pkgver=20130513
pkgrel=1
pkgdesc='Miscellaenous DEX (Dalvik Executable) tools. Including dexrehash which displays/recomputes checksum.'
arch=(any)
url='https://github.com/cryptax/dextools'
license=(BSD)
depends=(perl-digest-adler32)
makedepends=(git)
source=(LICENSE)
md5sums=(cc283015f95abdc7db365416df806c20)
options=(!strip)

__gitroot="https://github.com/cryptax/dextools"
__gitname="dextools"

package() {
	cd ${srcdir}

	# Git checkout
	if [ -d ${srcdir}/${__gitname} ] ; then
		msg "Git checkout:  Updating existing tree"
		cd ${__gitname} && git checkout
		msg "Git checkout:  Tree has been updated"
	else
		msg "Git checkout:  Retrieving sources"
		git clone ${__gitroot} && cd ${__gitname} && git checkout
	fi
	msg "Checkout completed"

	install -D -m 755 dexrehash.pl ${pkgdir}/usr/bin/dexrehash
	install -D -m 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
