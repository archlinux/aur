# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simoarpe
_gitname=ziggity
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="⚡️ Ziggity an ultra fast, keyboard driven terminal UI for Git, written in Zig."

pkgver=0.34.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
makedepends=('zig')
depends=('git')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums_x86_64=('994a91fa1f16bde2a4685b54a27b7358f0636d0738a751aa989f68f822e2a314')


build() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	zig build -Doptimize=ReleaseSafe --prefix "outputs" --cache-dir "zig-cache" --global-cache-dir "zig-global-cache"
}

check() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	zig build test
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	install -Dm755 "outputs/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
