# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simoarpe
_gitname=ziggity
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="⚡️ Ziggity an ultra fast, keyboard driven terminal UI for Git, written in Zig."

pkgver=0.66.0
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

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums_x86_64=('d9a9eadd5ec48a2182268588078589de63528b05f6541739c4cdcb68e1c2d6b5')


build() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	zig build -Doptimize=ReleaseSafe --prefix "outputs" --cache-dir "zig-cache"
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
