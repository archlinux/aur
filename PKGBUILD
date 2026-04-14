# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KrishnaSSH
_gitname=sorting-visualizer
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A sorting algorithm visualizer written in java"

pkgver=0.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-only')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('bash' 'java-openjfx')

options=(!strip)

noextract=("${_appname}-${pkgver}.jar")

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}.sh")
source_x86_64=("${_appname}-${pkgver}.jar::${_ghurl}/releases/download/${_gitversion}/sort-viz-${pkgver}-all.jar")
sha256sums=('4b9f69122c4b21b3d2ffec3be86e9e0a97dbc4bcd45834f5939cb14241138c53'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '7d021cc505466d2ea25ee802722efbda1de1e590817f51df8c103cc500553929')
sha256sums_x86_64=('5e4248b00e9f8a27019bb9fa23cc79e22d0142836873c7a1ab5af6edf469580a')


build() {
	cd "${srcdir}/" || exit

	cat ${_appname}.sh ${_appname}-${pkgver}.jar > ${_appname} && chmod +x ${_appname}
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
