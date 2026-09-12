# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MichaelMure
_gitname=mdr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A standalone Markdown renderer for the terminal."

pkgver=0.2.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/Readme.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_i686=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}")
sha256sums=('69fede02af22f36456868a664e1f3046ddf6927a56ddf524226656f60328cebd'
            '2d284c3a12c6712c91d8a52d7b5b2895419936c9618c9249ec8dabab7ec6d682')
sha256sums_x86_64=('9aa66a9c09672c721fc2dc0710f74370c2dca271a4bd5618bf2717f153fb1dbe')
sha256sums_i686=('f27d64538d82d938da681b515f611081c97175653b5efe336988010bbadfc74f')
sha256sums_aarch64=('3d43a8f1adbd5bcb15b752afe94634dd241dfcaae2b089c18bfcadef1e2557aa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
