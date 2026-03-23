# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_execname=fsel

_pkgauthor=Mjoyufull
_pkgname=fsel

pkgname=${_pkgname,,}
pkgver=3.3.1
pkgrel=1
pkgdesc="Fast TUI app launcher and fuzzy finder for GNU/Linux and *BSD"

arch=('x86_64')
license=('BSD-2-Clause')
url="https://github.com/${_pkgauthor}/${pkgname}"

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('adc5a9d10fb46602bc07b35883517af868e1ddf9f467ebc0feed924022ca12a0')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" "$pkgdir/usr/bin/${_execname}"

	install -Dm644 "USAGE.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
