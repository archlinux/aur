# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=furan917
_gitname=go-solar-system
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal app where you can explore solar systems"

pkgver=1.0.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5fdacb3f6f7b75bd525a8d685160fc261ce2f7db4074cbf7a4dd376df695eb2c'
            'dcfb0a6f46215c68ede3f5088eb72df4f059d033e1fef000f33fbff9e4c7ac19')
sha256sums_x86_64=('bd9a94a27bc417adbeda293ceb32fd14f5083ef988b836715fe6e3305d072bae')
sha256sums_aarch64=('9c8418525d23ff7b581c4c8549b68c41c7e96eb72cea79063a2f751988ca4545')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
