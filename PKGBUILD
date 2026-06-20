# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=eugenioenko
_gitname=ttt
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal text editor IDE"

pkgver=0.3.1
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

optdepends=('git: Source Control Features' 'ripgrep: Workspace Search')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('d21ba50e5c3251433633baa0d93a89a60671932a764af78ca10e216ab9c22a40'
            'c707616518e3fce85635504ec18ab7d12e204686a56f0b683601e300e6429aa2')
sha256sums_x86_64=('10c3e9efa8a39159e2c8394c88a8d7f2849a806dc9228b3195d716f1a7db5b67')
sha256sums_aarch64=('8cd43631011c920805fe668034d4b23770ff1102f833936689d16ac2729f5a64')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
