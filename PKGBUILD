# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nickprotop
_gitname=cxtop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A ntop/btop-inspired terminal system monitor built with SharpConsoleUI"

pkgver=0.0.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('b4c31667d967348099a35d15bf13343aa55fb526495199dd7ba88b9ab3319724'
            'c5d50f2ab68a8939a4c0986e3ab5f9fe21f5f8b525f013f72680a2198b14ee73')
sha256sums_x86_64=('e560c647c0c5103deeded5a2687ad1676066b8d8ccf4e9e14b1c8c51f5bcc8f5')
sha256sums_aarch64=('4a23023df866aa9fb24ee0db0d796b1cdee8fa6d08917579022f96759671cf69')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
