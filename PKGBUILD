# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tigerlang
_gitname=huntclaw
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A very fast find-and-replace utility"

pkgver=0.9
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")

makedepends=('zig')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums_x86_64=('0da7361d6b8a33b2afa008c227cce9cf56782eea713a70b82bed28ab844cd109')


build() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	zig build --release=fast --prefix "outputs" --cache-dir "zig-cache" --global-cache-dir "zig-global-cache"
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}" || exit

	install -Dm755 "outputs/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
