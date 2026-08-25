# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yutat23
_gitname=lsoff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="CLI / TUI that lists listening TCP/UDP ports"

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('5cd4bf733f0d2ed2c74af030ac170b9e2c2b54bdf2b06b53c9e625666acf95a5'
            '8fa6650c7c9bea4113c2981b4859e8b547ef5ceae3747d5aa3f5d2d7e6a5bad1')
sha256sums_x86_64=('7f909c43d9427f2f518804fd9abf7dea6b792df59dfbed9d5b9573f42ea2c38e')
sha256sums_aarch64=('e491f0bd2e4699277e6bc5a8ed84a24fae7b996588be2097f41a06552b060830')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
