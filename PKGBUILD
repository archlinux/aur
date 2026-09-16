# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ynqa
_pkgname=vy
_appname=${_pkgname}-cli
pkgname=${_pkgname}-bin
pkgdesc="Explore and query JSON and YAML, right in your terminal"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('248194408c38d7204458e56149b8ae5ebcc3b9202910aa48a79e4359d3a62bee')
sha256sums_aarch64=('acf05c738f90863d441d3dba0a1df0c391133c3520ed31edf8f19a836ec01dbb')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

package() {
	cd "${srcdir}/${_appname}-${_CARCH}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "default.toml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.toml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
