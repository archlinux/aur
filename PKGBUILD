# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=wilfredinni
_gitname=noodle
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A delicious REST client for your terminal"

pkgver=0.9.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5d7719129defb43b3301cf9434e42d52cadc452ac4c9c5442cabc2920dddb1f1'
            'fcf353912854f70ba3768b3755a934d16b8cbc98ed183cc1e8124639b179ef01')
sha256sums_x86_64=('35ad8e6b919fdcd702bdd10dcf9e694c7d1579be9b51014ec1bd6d33d6daa36a')
sha256sums_aarch64=('5ebaae44c9a936f500d862d8d337d68387ce1a150ef24391d8504350151715ac')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
