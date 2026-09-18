# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=0.9.0
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
            'd8742a22c29dd17266481c8884646446921964954dc64ffbdb7eba0ee97f499b'
            '5dd17cb7c06721a5874804edbf9cd305191d6f16f5baab8ee15873bc90408e1c'
            '0fbfe7d5044c487bd96dc9010c9c4ce769f6f47c3717375b06e8290065b60daa'
            'ef10bbdfbb5f0601d6e6e9eaf699c4b882564267ba5743bb9359fb9f89d2a60b'
            '200c04aad5ff879be890018f281aee1fecdd53109694fbbeb34e596ea0947406')
sha256sums_x86_64=('0c24b7dea056113033e811d0f6c400f91dafde3b4c1388063177dacebbb81304')
sha256sums_aarch64=('476ebdb3c837e7d928a465a43dc3c94a6d1416c09ebc51908e6a4e7f8845ecff')


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
