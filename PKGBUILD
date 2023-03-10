# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=ps3toolchain
pkgver=20230307
pkgrel=5
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
	'171871f1bbdc77d9768e795fad0b06d38dd10e1dc6c67fee71560886c0bbb876'
)

_prefix="/opt/ps3dev"

package() {
	mkdir -p "${pkgdir}${_prefix}"

	echo "export PS3DEV=\"${_prefix}\""   > "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PSL1GHT=\"\${PS3DEV}\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PATH=\"\${PS3DEV}/bin:\${PATH}\""     >> "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PATH=\"\${PS3DEV}/ppu/bin:\${PATH}\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"
	echo "export PATH=\"\${PS3DEV}/spu/bin:\${PATH}\"" >> "${pkgdir}${_prefix}/${pkgname}.sh"

	# env-modules (optional)
	cp "${srcdir}/modulefile" "${pkgdir}${_prefix}"
	mkdir -p "${pkgdir}/etc/modules/modulefiles/"
	ln -s "${_prefix}/modulefile" "${pkgdir}/etc/modules/modulefiles/${pkgname}"
}
