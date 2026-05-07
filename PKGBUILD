# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=akeyshually
_pkgauthor=DeprecatedLuar
_pkgname=akeyshually
pkgname=${_appname}-bin
pkgdesc="Actually, this is a shortcut daemon that is configured by config file and is graphical session agnostic"

pkgver=0.5.1
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
sha256sums=('005f9fabc595bbf2986ace0dd793070f032588132987c53ad734d2cbcdb2049d'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e'
            '576012be74acec6a8332df203af16c46f637951710c0c40c3b5dd86b0f831bc7')
sha256sums_x86_64=('596cdf4cfdf94277fcc047996aa97fefe5894de5194507da764ea1cd8ba8a5a0')
sha256sums_aarch64=('650c1e71f47e178a4977235005cb05c183f63a1b74b09ab511c842ebcfbb2c6d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
