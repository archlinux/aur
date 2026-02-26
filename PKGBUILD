# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_execname=setrixtui

_pkgauthor=Mjoyufull
_pkgname=Setrixtui

pkgname=${_pkgname,,}
pkgver=0.4.1
pkgrel=1
pkgdesc="Tetris Sand game in Ratatui"

arch=('x86_64')
license=('GPL-3.0')
url="https://github.com/${_pkgauthor}/${pkgname}"

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('722e70fb1264ebe2185c0838a1a6b68051362441f27ee580e6682cbaec47dd2a')

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
