# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=epilande
_gitname=ccmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="🔮 Track all your AI coding agents (Claude Code, Codex, Cursor, ...) in tmux and jump to the one that needs you"

pkgver=1.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
depends=('glibc' 'tmux')
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('d9a1bcb4480c0d96bb14c31d551fa23c233721a5ac85d0f6230a3a2a6dd2b4c5'
            '1ab02a35c31af7c45c695a5f0d24581f0c6a21102ab311d9f037e84ad3566569')
sha256sums_x86_64=('24cd0e1bad80d221678d9032e00db182cd5f3480064cf401e4930e172cb5e08f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
