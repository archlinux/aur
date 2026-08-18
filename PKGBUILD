# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=0.4.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"DESIGN-${pkgver}.md::${_ghurlraw}/docs/DESIGN.md"
		"DOCUMENTATION-${pkgver}.md::${_ghurlraw}/docs/README.md"
		"TIGER_STYLE-${pkgver}.md::${_ghurlraw}/docs/TIGER_STYLE.md"
		"IMPLEMENTATION_NOTES-${pkgver}.md::${_ghurlraw}/docs/IMPLEMENTATION_NOTES.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('a9e7a0b2ca0bb923c316c0cc1b9f60e8407ebbeb974467cea6b808644b5dd611'
            '29427708d3f4ab06f7a6cc52a4aa98ae172fd63b3b29dd187ac65c576289a3cf'
            '04f696c3150351c8d8af04fd035280f8d1b4a396fd3bbd55573aa4d5f27fa59f'
            '1d0e97157b7a712b89bf03a2146b84f8f3bccab31369528ef81b5ef48c256a40'
            'd82d79017e49a24717c2c357b099584f8f542e25986cddcdb287450b368504c5'
            '51d2a7449b51f65432ba776624c003c4ac559a0b898993c5e5e9132b5e0eb6a5')
sha256sums_x86_64=('e0798e0149495939790618833ba8a65198bc57b06e1224fdd9f329f0d6585e8c')
sha256sums_aarch64=('ac657016dc910f93bc155c4372104ecf26901556d41136a4a03ea58e1f205dfa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "TIGER_STYLE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TIGER_STYLE.md"
	install -Dm644 "DOCUMENTATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATIONmd"
	install -Dm644 "IMPLEMENTATION_NOTES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/IMPLEMENTATION_NOTES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
