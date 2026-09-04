# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vincelwt
_gitname=gloomberb
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Finance terminal, in your terminal"

pkgver=0.12.0
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
sha256sums=('7baf0b5faea65cd1add95d13558690f6e20954ebc403e4a99726cb9fe73773a9'
            '735bda4a87be6cbfa596f6957866c94838a171ed7e371d6cb59998e60b87f1a7')
sha256sums_x86_64=('a1a5c94ab9cbec1d94009bb9a78434aab9b1ba12085cfe03d24b7b7c0a552e5e')
sha256sums_aarch64=('f666b1035b99ec8f87ac574ab73f3a7f939598eb1164c2c3f53d2630b04efb2c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
