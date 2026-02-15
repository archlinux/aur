# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_execname=setrixtui

_pkgauthor=Mjoyufull
_pkgname=Setrixtui

pkgname=${_pkgname,,}
pkgver=0.4.0
pkgrel=1
pkgdesc="Tetris Sand game in Ratatui"

arch=('x86_64')
license=('GPL-3.0')
url="https://github.com/${_pkgauthor}/${pkgname}"

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a21b771f1690ffd0415cd903c93d6909a185344190e3ee246dfb2cf8a4d21484')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" "$pkgdir/usr/bin/${_execname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
