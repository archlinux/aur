# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tigerlang
_gitname=huntclaw
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A very fast find-and-replace utility"

pkgver=0.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")

makedepends=('zig')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums_x86_64=('4c333d0c353b559c8f43843464bb0c7775a11a07460b5c11b72a273a53462302')


build() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	zig build --release=fast --prefix "outputs" --cache-dir "zig-cache" --global-cache-dir "zig-global-cache"
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	install -Dm755 "outputs/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
