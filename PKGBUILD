# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yutat23
_gitname=lsoff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="CLI / TUI that lists listening TCP/UDP ports"

pkgver=0.1.3
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

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('af34f9abfa05014f00594d494f8a890ef5876e8f7498bbb2824596dfebfaeb61'
            '8fa6650c7c9bea4113c2981b4859e8b547ef5ceae3747d5aa3f5d2d7e6a5bad1')
sha256sums_x86_64=('9bb5fa64a59ee05243728931796e059b9e0bcaecf1c3059ee884f6e98ca54857')
sha256sums_aarch64=('9f502f77375e2e021e09e216ad8a964e913fe38982f2b105aae65a8d46fd5b8e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
