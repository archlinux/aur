# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nickprotop
_gitname=cxfiles
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal file explorer built with SharpConsoleUI"

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
sha256sums=('b0841376bb59150226c7f44f47506d91a763ae35987456ab6435c50c7146ce56'
            'c5d50f2ab68a8939a4c0986e3ab5f9fe21f5f8b525f013f72680a2198b14ee73')
sha256sums_x86_64=('a6473976aebef60e091288f693809b606c742c70588b9274d30668e313b6ea7c')
sha256sums_aarch64=('f31c542c3864e23ca4ae67d4430797c86c55a1b8efddabcebe9be33cfc0b336d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
