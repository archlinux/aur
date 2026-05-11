# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=akeyshually
_pkgauthor=DeprecatedLuar
_pkgname=akeyshually
pkgname=${_appname}-bin
pkgdesc="Actually, this is a shortcut daemon that is configured by config file and is graphical session agnostic"

pkgver=0.5.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}" "${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"${_appname}.service")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[1]}")
sha256sums=('c7941b1a563c68719c30d7ff7a937b28b680588d094e654020972026ac2e8471'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e'
            '576012be74acec6a8332df203af16c46f637951710c0c40c3b5dd86b0f831bc7')
sha256sums_x86_64=('0509bc579e1f26bb467d545b487537a0847a89535b514bc4c4fba76602fd16e9')
sha256sums_aarch64=('57210983d25311482931f23159bebf27eb093443e750724e24465da47825ed9e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
