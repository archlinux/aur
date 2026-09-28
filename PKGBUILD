# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=titus
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="High-performance secrets scanner with 400+ detection rules with live credential validation"

pkgver=1.2.10
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
sha256sums=('4b1e6c973b452cb0fe8eac2b364688a63d1132b791b41fa5f65ebe4614ac7ada'
            'c79772859956ceea1389d4f13fc6791d66cf67057cdfda13e137f7e4fe1e5b08')
sha256sums_x86_64=('03a3b49eb9f8dbc56731291b4675cba65c34ee6e3638740320731c8ea6b9dee7')
sha256sums_aarch64=('6c037e3c430f03b8538fe307a1d54819ca0cc34c0fc734b86d8043ffe6041034')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
