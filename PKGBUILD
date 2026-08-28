# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=bapatchirag
_gitname=revision
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Lazygit for SVN - a fast, keyboard-driven TUI for SVN"

pkgver=1.7.1
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
sha256sums_x86_64=('e227e059766a2ea57f5ea68f12c092475bdcd58eee1ea0e8d47d71d4348aa45a')
sha256sums_aarch64=('c303b5d4438cd08fc7b0687f64dd5d66838efc5627851ff45c954e79b3547327')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
