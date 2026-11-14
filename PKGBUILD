# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=0.9.1
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
            'd3e03103dbde7aa8a5bdec5e4c28d600d11aa006c04c477f547f02987f4ddd9f'
            '116f550b98c27f6b800addce616c83456da780c1af582f6217a8839da4042084'
            '0fbfe7d5044c487bd96dc9010c9c4ce769f6f47c3717375b06e8290065b60daa'
            'ef10bbdfbb5f0601d6e6e9eaf699c4b882564267ba5743bb9359fb9f89d2a60b'
            '200c04aad5ff879be890018f281aee1fecdd53109694fbbeb34e596ea0947406')
sha256sums_x86_64=('3f708c0f90203bd1dda6254881fd7b82d4e30519a5f00849aa6d013071183e60')
sha256sums_aarch64=('fa467da8c206cc8c7360a50271a233c5a796df54e5379434ca972b8f224b3f77')


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
