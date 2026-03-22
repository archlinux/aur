# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=akeyshually
_pkgauthor=DeprecatedLuar
_pkgname=akeyshually
pkgname=${_appname}-bin
pkgdesc="Actually, this is a shortcut daemon that is configured by config file and is graphical session agnostic"

pkgver=0.3.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}" "${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"${_appname}.service")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}")
sha256sums=('89258303c90e818000d7c92643072f1b8071a67c26a4d55de8ef7c2c7f845a5a'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e'
            '576012be74acec6a8332df203af16c46f637951710c0c40c3b5dd86b0f831bc7')
sha256sums_x86_64=('23d61565f8849fc52400db104ad472c46d1e3f68a2dbe3db6f96750df3a4db75')
sha256sums_aarch64=('aef6580a8a5b00cc81a6a9e459d70f0405e42a4aeaf832f17d7ea06c1957a4cd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.service" "${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
