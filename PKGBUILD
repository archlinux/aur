# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=puradox
_gitname=tinhorn
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal dice roller: shake the dice, watch em' fly, hear it bounce."

pkgver=0.1.2
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
sha256sums=('1c1f2666f17946376a629ac29861dc0dc381e6467fb3991417f1ce60a953a7e7'
            '2a5d42337c1bd9e3046d9f596e6ee79e693d8a248d7cc8847334625decb79f4a'
            '8e1ae0be770b07175ec82b0f828fe8ab63a8ed1a767d3dbd3a56cf8186bd6340')
sha256sums_x86_64=('4e5f02e16e6a916f0539795347a7c1f76f7b6137a75c5b0c10a9cbe080567fb6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
