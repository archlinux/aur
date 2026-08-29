# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=opmr0
_gitname=fyr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, minimal file watcher that runs a command every time you save"

pkgver=1.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

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
sha256sums=('fc05e96721bb25906648d4e89c0d538a006e33c6cb65b71a9c67c4126486688a'
            'fe66e326fee20e3cef980dc69e5921df6c17253120efa9d9974bbd0d942cf244')
sha256sums_x86_64=('a370626cf9663f50354eb9593346424315a7b8f0cbeef1aee708c8cb2ba4993f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
