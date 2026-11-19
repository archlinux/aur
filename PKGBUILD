# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=diode-editor
_gitname=diode
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal text editor"

pkgver=0.19.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'libatomic')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('0565ac86e75b6d4e08ecb00cb34692bf7e0269751393abaac8242c2cba188f6b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('d84ef0a056bd51bb67455b75204ce2b8b3d9b61c85f1969e8c288856b4d5aa27')
sha256sums_aarch64=('1f334422779347b2247c8f82d7acc6866aa10e71f235169520f523015c4c47bc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
