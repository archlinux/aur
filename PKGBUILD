# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=puradox
_gitname=tinhorn
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal dice roller: shake the dice, watch em' fly, hear it bounce."

pkgver=0.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'alsa-lib')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('e71f2434e8efa05d99b0977e6b126259d6a2dfda4909c64d0a0276c1ffb2e276'
            '2a5d42337c1bd9e3046d9f596e6ee79e693d8a248d7cc8847334625decb79f4a'
            '8e1ae0be770b07175ec82b0f828fe8ab63a8ed1a767d3dbd3a56cf8186bd6340')
sha256sums_x86_64=('79a910159d1223a48c5fe0042cb49508c1ed7f42b9463f02d842e5dc0cdec8f5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
