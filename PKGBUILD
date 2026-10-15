# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=prism
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="TUI RGB color picker written in Rust"

pkgver=0.1.5
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
sha256sums=('883fce580b293445952508dd4f05968c2aa7144789e22568c920ba61aaf15b0a')
sha256sums_x86_64=('6cb78b2e3ce48659150eda010495976ef566dc30c598175a612a03fcc5e75aaf')
sha256sums_aarch64=('f016eda7e8ac1b1e30fa8c5f5a9512fbe7df8f560572e4da9c4896bef04fc40d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
