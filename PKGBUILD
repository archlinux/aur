# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Knuspii
_gitname=CrunchyCleaner
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="💾🧹 A lightweight, software cache cleanup tool for Windows & Linux."

pkgver=2.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-arm64")
sha256sums=('1ce542616597530cba5a61885ea352c9d7dd2c80ea784b035f3133c02daee3bc'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('0048c2a7f23c980ce807d6820a1e0d1a1a22bf192a0eda22393c65bde68e7e26')
sha256sums_aarch64=('0ba0bddacb80443d377d542b7918648775a69e3522160b22f0c2e8a9fce20973')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
