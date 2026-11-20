# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simoarpe
_gitname=ziggity
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="⚡️ Ziggity an ultra fast, keyboard driven terminal UI for Git, written in Zig."

pkgver=0.65.0
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
sha256sums_x86_64=('c8e33a72c97aeb78b41d58f4a9e1f8eebea68f804fa3fafb1b28f7c3d2547408')


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
