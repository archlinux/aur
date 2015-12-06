# Maintainer: Masanori Ohgita <mp_aur[at]ohgita[dot]info>
pkgname=rtl8188eu-git
pkgver=396d6c1
pkgrel=1
pkgdesc="RTL8188EU driver"
url="https://github.com/lwfinger/rtl8188eu"
arch=('i686' 'x86_64')
license=('GPL')
builddepends=('linux-headers')
source=(
	"https://codeload.github.com/lwfinger/rtl8188eu/tar.gz/${pkgver}"
)
sha256sums=(
	'141f98d144d646485d972040b44b9cf1382a4e3e180bc9d073cdc18fad55ac0c'
)
install=rtl8188eu.install

_reponame='rtl8188eu'

build() {
	
	cd "${srcdir}/${_reponame}-${pkgver}/"
	make all $MAKEFLAGS
}

package() {
	
	cd "${srcdir}/${_reponame}-${pkgver}/"
	_kver=$(uname -r)
		
	mkdir -p "${pkgdir}/lib/modules/${_kver}/kernel/drivers/net/wireless"
	install -p -m 644 8188eu.ko "${pkgdir}/lib/modules/${_kver}/kernel/drivers/net/wireless"

	mkdir -p "${pkgdir}/lib/firmware/"
        cp rtl8188eufw.bin "${pkgdir}/lib/firmware/"

        mkdir -p "${pkgdir}/lib/firmware/rtlwifi"
        cp rtl8188eufw.bin "${pkgdir}/lib/firmware/rtlwifi/"

}

