# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zoxy-io
_gitname=zoxy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A zero-allocation reverse proxy and load balancer in Zig ⚡"

pkgver=1.1.0
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
            'fdb624bfe4915a722f1b8c80b88f924f8399bd279fddc4fc69e53c6d70dde517'
            'af934948d310ed9cf897c2fcaf0de827ce1d3277ce188f243c53a208bcf8029d'
            '5962938ba8a9ee635fac2b13ad6e992baba1164d74c7c8fca3e97b2c107d5399'
            'ef10bbdfbb5f0601d6e6e9eaf699c4b882564267ba5743bb9359fb9f89d2a60b')
sha256sums_x86_64=('a135e6ca6d2cdb74f266a6af6190c546250a60f9fcc297d875d08c6b554f8672')
sha256sums_aarch64=('cbde227db980fe1a3fa14fd1b246afccd0b922c7835b7cff07ce966dfd0ccc08')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "TIGER_STYLE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TIGER_STYLE.md"
	install -Dm644 "DOCUMENTATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
