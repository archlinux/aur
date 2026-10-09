# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=clarkarch
_gitname=tfm-tui
_appname=${_gitname%-tui}
pkgname=${_gitname}-bin
pkgdesc="Modern mouse-first terminal file manager"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

url="https://${_gitauthor}.github.io/${_gitname}/"
_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.gz")
sha256sums=('5efaf718fa397709b953e58f9eec339762be389fb9806de0ef9e1a705bfaf6ba'
            'b2d4efd70a3897fa8ccfa35574c646be83ad2fd1459cf0e5661d2f48187cad4f')
sha256sums_x86_64=('d6201d96d763f16be567f56ab22c1dd523142b35b7a7ce4f1ffd2c5eb89f326c')
sha256sums_aarch64=('5d2ae3b049783377edbf5628cb19c512234c1abdd39c87fed67dc4536ee0164d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
