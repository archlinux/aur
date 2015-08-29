# Maintainer: Taylor Smock <vorpalblade77@gmail.com>
# contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt)
# (gemmaeiil) (ddoott) (ccoomm)>

__pkgname="shim"
pkgname="${__pkgname}-efi"

pkgver=0.9
pkgrel=2
pkgdesc="Simple bootloader for x86_64 UEFI Secure Boot"
url="https://github.com/rhinstaller/${__pkgname}"
arch=('x86_64')
license=('GPL')
options=('!strip')

makedepends=('gnu-efi-libs')
depends=('pesign' 'dosfstools' 'efivar' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${pkgname}-git" 'shim-efi-x86_64' 'shim-efi-x86_64-git')
provides=("${pkgname}=${pkgver}" "shim-efi-x86_64=${pkgver}"
"shim-efi-x86_64-git=${pkgver}")

source=("${url}/releases/download/${pkgver}/${__pkgname}-${pkgver}.tar.bz2"
	${__pkgname}.patch)
md5sums=('fc8fb830c0e3eb66f73b0a7872a71279'
         '84c5d7dbe5200f0709809f8376cd2004')

prepare() {
	cd "${srcdir}/${__pkgname}-${pkgver}/"

	patch -i ../${__pkgname}.patch
}

build() {

	cd "${srcdir}/${__pkgname}-${pkgver}/"

	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	make
	echo

}

package() {

	cd "${srcdir}/${__pkgname}-${pkgver}/"

	install -d "${pkgdir}/usr/lib/shim/"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/shim.efi" "${pkgdir}/usr/lib/shim/shimx64.efi"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/MokManager.efi.signed" "${pkgdir}/usr/lib/shim/MokManager.efi.signed"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/fallback.efi.signed" "${pkgdir}/usr/lib/shim/fallback.efi.signed"

}

