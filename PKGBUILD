# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=tock
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="Terminal calendar app written in Rust"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlicense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('a73fb441b580ef17b1ec55fb1825972a9871694c9c420649770473032b180f91')
sha256sums_x86_64=('ae6ae0922e37d18255123847d7033cd6be846307031938d088ac67af140d26f5')
sha256sums_aarch64=('c0774f888dd5c795d605fa918818da633dbb6b1f762606bbd0e1ae3a768bd06e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
