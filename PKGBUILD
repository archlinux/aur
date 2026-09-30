# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zsuroy
_gitname=dockerview-go
_appname=${_gitname%-go}
pkgname=${_appname}-bin
pkgdesc="A simple terminal-based Docker performance monitor that displays real-time container statistics in a beautiful table format"

pkgver=0.1.25
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('74bd6a2125099e483c4f70a69ce72afcbf8c3b1416dbbd08b25d57b8455e265c'
            'cf24e4cc5e482fe153f66c4b6582cbca7142668b001009973d6d77eac23e68ad')
sha256sums_x86_64=('1ea11d551160efa3de70ec48b5cb922097eea6c532d437f0754efb204e25479a')
sha256sums_aarch64=('70a8e4a99c341f9998776e965f7e6c4191d7220499a237b5b6269dd5220e140a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
