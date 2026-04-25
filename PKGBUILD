# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=akeyshually
_pkgauthor=DeprecatedLuar
_pkgname=akeyshually
pkgname=${_appname}-bin
pkgdesc="Actually, this is a shortcut daemon that is configured by config file and is graphical session agnostic"

pkgver=0.4.0
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
sha256sums=('4ca35c6019958f5fb2c632d6235929ab092140607c30f5acdbd18d7f0addc25b'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e'
            '576012be74acec6a8332df203af16c46f637951710c0c40c3b5dd86b0f831bc7')
sha256sums_x86_64=('3606f1934dab1584b93e080c362a217a1c822be6919eda45be6c84b1f5a8432e')
sha256sums_aarch64=('b115ac7cdd1afbe2c18e9dd527c67a2d759f5a3ed4dcb0749751d83bd63a3a77')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
