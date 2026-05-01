# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=honeymux
_gitname=honeymux
_appname=hmx
pkgname=${_gitname}-bin
pkgdesc="A new UX layer for the terminal, built on tmux"

pkgver=0.104.0
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
sha256sums_x86_64=('d8e18ee3640770b451c0afd7760d570ca027a0917b19c03c53d1e0878b91907e')
sha256sums_aarch64=('c555b0ac9533b08467c11d9ea8919505c44cbe8d6b5836dcb3aa63183025bbf0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
