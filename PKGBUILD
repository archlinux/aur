# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NayJi7
_gitname=gitoui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal Git client with an image-rendered commit graph and GitHub PRs"

pkgver=0.4.0
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
sha256sums=('c12a8a6318f585bc09864ec81dab83bd247b7e321836caa75611a08105174e07'
            '99d61b26cd4453bbc03103277ebb8ff89f7854eade50dbf20ac68b86c1b2be05')
sha256sums_x86_64=('84f8e298b723cf41ea85d2dffec042dc02b97bf62b2fd34e6cd42dc6b3f2d14b')
sha256sums_aarch64=('10dd07ab360535ea83275128d0549c726e59df66bb37039d152e8bd3fe7e0465')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
