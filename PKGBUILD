# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=polblancoo
_gitname=tubetui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="YouTube — and your own videos and music — in the terminal"

pkgver=0.7.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('0c632fdaad3edd3af2d4f47dc50581d0bdd45e09f72a9a6e7876b5c6615b9c9b'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('e5e46401aafd4a84c555ad08f2ecd2585f72374169597eb9de28b4d4f59bb370')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
