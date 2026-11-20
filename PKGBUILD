# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NayJi7
_gitname=gitoui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal Git client with an image-rendered commit graph and GitHub PRs"

pkgver=0.5.0
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
sha256sums=('499e2b63517f2b445353cb7e3634cdadbd58bd92b5840e35125e6e82481a98d6'
            '99d61b26cd4453bbc03103277ebb8ff89f7854eade50dbf20ac68b86c1b2be05')
sha256sums_x86_64=('254252b7c3488c07b221adfe35cfcadef76ae5c66fdab80a8b8fcd11409c9317')
sha256sums_aarch64=('1a5ac4a54cb241163e15f40fe99fa0f4d4619b6a5d3088510ba2ffb879b10891')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
