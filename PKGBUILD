# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=1.3.1
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
		"TIGER_STYLE-${pkgver}.md::${_ghurlraw}/docs/TIGER_STYLE.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('a9e7a0b2ca0bb923c316c0cc1b9f60e8407ebbeb974467cea6b808644b5dd611'
            '59f33b76f91bcbdf6f0fa5c4d435634825fd0ced00e6ba2d6fcd942f0aa39a30'
            'bb1ab08ac7d8c260608700c1f277bb5ce5698375a7a68ec8d0dd4d5c43b23f9a'
            '41a726b9b0b4a89d2aff7cbab6d72b0d2858323b8b82dde0e404fcdd5e5af2a0'
            'ef10bbdfbb5f0601d6e6e9eaf699c4b882564267ba5743bb9359fb9f89d2a60b')
sha256sums_x86_64=('8195e22addb4eeb9d035e016e29516de19963bd49d0773fb6e5e2767d6426225')
sha256sums_aarch64=('3a469b521fd411fdaa5c67c119bef17573a76464ce2a5ec1a985a544f54c88af')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "TIGER_STYLE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TIGER_STYLE.md"
	install -Dm644 "DOCUMENTATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
