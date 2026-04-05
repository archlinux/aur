# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cesarferreira
_gitname=pirate-ctl
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Search and download torrents via the CLI"

pkgver=0.1.0
pkgrel=1
_gitversion=main
_gitcommit=4c4aa223c31e4fd08c17bd7f325361c9fb8b8143

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('rust' 'openssl')
depends=('glibc' 'libgcc')

options=(!strip)

source=("git+${_ghurl}#commit=${_gitcommit}"
		"LICENSE")
sha256sums=('1ea669f5118212a05e14a96a6094199905593d6fd6fbf6f52c55d02d90f108d1'
            '57764ebae827c1c96dc5c1b74e2579ff34d3abcaabb54f5e5498fb2f612330cc')


build() {
	cd ${srcdir}/${_gitname} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_gitname} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
