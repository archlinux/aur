# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=homerours
_gitname=jumper
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Accurate and fast files/directories' jumper"

pkgver=1.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENCE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('c4e877fa72dbdc6a40438c12ff0ec79644eef6d0c627f776931cd56c7d2b86a6'
            '6504a1b173cf6f9c16873d14f07100d98bc2b381c131b2368b599debb94fcd3a')
sha256sums_x86_64=('29dfdf03763cb24fdc61e7d6a0958932d652fe49f1f3482e48c3e6aa465e4f1b')
sha256sums_aarch64=('eb46b65f70b278269744a40195fec4b1be47698a908852b0df3dd0c9b8c7d708')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
