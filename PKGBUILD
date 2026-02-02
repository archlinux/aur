# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hanebox
_pkgname=ekphos
pkgname=${_pkgname}
pkgdesc="A lightweight, fast, terminal-based markdown research tool inspired by Obsidian"

pkgver=0.20.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc' 'gcc-libs')
provides=("${pkgname}")
makedepends=('rust')

source=("${_pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('176e455367d6ac361ee2802d7310f4595bc4a94c05781f3a95a74e6d68d8b0ba')

build() {
	cd ${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
