# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=bapatchirag
_gitname=revision
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Lazygit for SVN - a fast, keyboard-driven TUI for SVN"

pkgver=1.7.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('subversion')
provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5d22c5cd7de1ea232bf6fe7277b88a265c80213df7f7135147d5389288979617'
            'fa0744b49963fef94ca4dcce4d4dc94b9ea7d86849675f2b411c373fe5cc1aa7')
sha256sums_x86_64=('cd96fe0310c2fb9ada357b08e070f022fb1b3a3732c59e731af0b68d60bf88aa')
sha256sums_aarch64=('83694b129366b422cc6027ed765fab9bdd1bf514f2d835d91a0b651977ac442d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
