# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vincelwt
_gitname=gloomberb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Finance terminal, in your terminal"

pkgver=0.14.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.gz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.gz")
sha256sums=('1b2ff524789445bcd3fcb597eca30856bfccbdb94fa03a834a744e1cd423385f'
            '735bda4a87be6cbfa596f6957866c94838a171ed7e371d6cb59998e60b87f1a7')
sha256sums_x86_64=('3a027f96f950ebf9a9f9246ffa847b54bd3b52a24d94e3d13eeb323f11f8d8ca')
sha256sums_aarch64=('8722057a3d7c231ea789cb6ac377a45ee7541ebc9583b8dab57e77fcb881895c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
