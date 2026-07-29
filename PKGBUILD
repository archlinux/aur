# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=epilande
_gitname=ccmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="🔮 Track all your AI coding agents (Claude Code, Codex, Cursor, ...) in tmux and jump to the one that needs you"

pkgver=1.2.2
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
sha256sums=('ae5cd938c00242294ebaf6d794e83717c8e272fc65d40ae6bc6087fd03b6b1ca'
            '1ab02a35c31af7c45c695a5f0d24581f0c6a21102ab311d9f037e84ad3566569')
sha256sums_x86_64=('81e3efd95f2a8c761c575b2351399959485ae2ca25cffc017c1723fba3d0cf81')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
