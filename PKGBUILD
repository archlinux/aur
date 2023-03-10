# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=ps3toolchain
pkgver=20230307
pkgrel=4
pkgdesc='Meta package for tools used in the creation of homebrew software for the Sony PlayStation 3 videogame system.'
url='https://github.com/ps3dev/ps3toolchain'
arch=('any')
license=('MIT')
depends=(
	'ps3-ppu-binutils>=2.40'
	'ps3-ppu-gcc>=9.5.0'
	'ps3-spu-binutils>=2.22'
	'ps3-spu-gcc>=9.5.0'
	'ps3-psl1ght=20230214'
)
optdepends=(env-modules)
install=${pkgname}.install
source=(
	"modulefile"
)
sha256sums=(
	'28cfac82649e70d080b3a41a82050c169eb8ed7d5a298cf0d68aa89d5b7cf136'
)

_prefix="/opt/ps3dev"

package() {
	mkdir -p "${pkgdir}${_prefix}"

	echo "export PS3DEV=\"${_prefix}\""   > "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PSL1GHT=\"\${PS3DEV}\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PATH=\"\${PATH}:\${PS3DEV}/bin\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PATH=\"\${PATH}:\${PS3DEV}/ppu/bin\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PATH=\"\${PATH}:\${PS3DEV}/spu/bin\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"

	# env-modules (optional)
	cp "${srcdir}/modulefile" "${pkgdir}${_prefix}"
	mkdir -p "${pkgdir}/etc/modules/modulefiles/"
	ln -s "${_prefix}/modulefile" "${pkgdir}/etc/modules/modulefiles/${pkgname}"
}
