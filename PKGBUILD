# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=0.4.1
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
            '4706116a5d87b487fa6876d8e78d03c193990de3b545bde6fe1ac8497be01ac1'
            '1d0e97157b7a712b89bf03a2146b84f8f3bccab31369528ef81b5ef48c256a40'
            'd82d79017e49a24717c2c357b099584f8f542e25986cddcdb287450b368504c5'
            '83db16e8c6f9e90c2905321cf2f8cfa584d2f7bc862da6ec4b001b12462f33a1')
sha256sums_x86_64=('9856a090859e76601aa67ffa1047db1cdb1e8889974b7afe4bae7dd4cda0af81')
sha256sums_aarch64=('676aaa39f5253eff47d9438b33ae5d176aeaa3e2f5e6d3031e820f60990d7742')


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
