# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NayJi7
_gitname=gitoui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal Git client with an image-rendered commit graph and GitHub PRs"

pkgver=0.3.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('git')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('d1636253aadd81c35bada1e4dfe1542c39eaccf8aa133958503150d8a95fff02'
            '99d61b26cd4453bbc03103277ebb8ff89f7854eade50dbf20ac68b86c1b2be05')
sha256sums_x86_64=('761b7edd68ef31eabbe6f8f4946d6335d77cb80082f3a5d4a3b2efba6d080ee7')
sha256sums_aarch64=('fcdf0d5db6167d1e2587ea3f5d0f2a7ab3f7ed48767d1777dca9bc8734751a8c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
