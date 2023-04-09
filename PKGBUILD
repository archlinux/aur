# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=ps3-env
pkgver=20230409
pkgrel=1
pkgdesc='Meta package for tools used in the creation of homebrew software for the Sony PlayStation 3 videogame system.'
url='https://github.com/ps3dev/ps3toolchain'
arch=('any')
license=('MIT')
optdepends=(env-modules)
install=${pkgname}.install
source=(
	"ps3toolchain.sh"
	"ps3libraries.sh"
	"modulefile_ps3toolchain"
	"modulefile_ps3libraries"
)
sha256sums=(
	'd4d4405bf7eadabe4bf84d08242dc2ea4f2940369fc7b31733625a7a69185d48'
	'7d73f2890c927a28b28eb38894423dabfd395077f5d6dc496aeda444a1741efd'
	'8d0004caf04a340777f6b1aecef7745bb061974e8bcccaea1f6d92a3dec5c9c7'
	'512cac1d9f9e11f93898f1f78d7767b27a3597a8c8f41e7675ba9962dedb838f'
)

_prefix="/opt/ps3dev"

package() {
	mkdir -p "${pkgdir}${_prefix}"

	cp "${srcdir}/ps3toolchain.sh" "${pkgdir}${_prefix}"
	cp "${srcdir}/ps3libraries.sh" "${pkgdir}${_prefix}"

	# env-modules (optional)
	cp "${srcdir}/modulefile_ps3toolchain" "${pkgdir}${_prefix}"
	cp "${srcdir}/modulefile_ps3libraries" "${pkgdir}${_prefix}"
	mkdir -p "${pkgdir}/etc/modules/modulefiles/"
	ln -s "${_prefix}/modulefile_ps3toolchain" "${pkgdir}/etc/modules/modulefiles/ps3toolchain"
	ln -s "${_prefix}/modulefile_ps3libraries" "${pkgdir}/etc/modules/modulefiles/ps3libraries"
}

