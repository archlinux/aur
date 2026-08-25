# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=titus
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="High-performance secrets scanner with 400+ detection rules with live credential validation"

pkgver=1.2.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('017ae73d4f1c82a311ff03e1b2989430145a824e1c82ce2de99d48e4a4c3324d'
            'c79772859956ceea1389d4f13fc6791d66cf67057cdfda13e137f7e4fe1e5b08')
sha256sums_x86_64=('435f2b37e5532d850ddedc32dd366cc213af5f32b1336a2a0d8be34a6dea4c50')
sha256sums_aarch64=('1e1af3e80f963cecf04ad2c5288d3f7521868c52dc4529a594cd99c9b45ec559')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
