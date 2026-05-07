# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=honeymux
_gitname=honeymux
_appname=hmx
pkgname=${_gitname}-bin
pkgdesc="A new UX layer for the terminal, built on tmux"

pkgver=0.106.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_gitname}")
depends=('glibc' 'libgcc' 'tmux')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('47976b36b3716dd7a25174ff7d7b7911a72f3c1ff4e810ee6f76e8e4da8ac3e0'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('a82ab73b00ba8f43c47d033cea763f948295e68684daa28fd7dcde17a4276cbd')
sha256sums_aarch64=('6cbb836ac03322bd84daa62718738ab4e191aa743e0eba1392f9006185ea1681')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
