# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=gazette
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="Terminal reader for your personal daily news digest written in Rust"

pkgver=0.1.4
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
sha256sums=('eac89fe1792082525069d2aeb565a1335db39b883cbbfe4571909f5259cf8276')
sha256sums_x86_64=('d99ea79192fec68983082de5623c04aad2621435bfb640171307048f145e1450')
sha256sums_aarch64=('02bd8a745c10de73a7380b2994c329f890d15e7a977bdd596ce8af2d6fc24c41')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
