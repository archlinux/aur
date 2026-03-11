# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_execname=fsel

_pkgauthor=Mjoyufull
_pkgname=fsel

pkgname=${_pkgname,,}
pkgver=3.2.0
pkgrel=1
pkgdesc="Fast TUI app launcher and fuzzy finder for GNU/Linux and *BSD"

arch=('x86_64')
license=('BSD-2-Clause')
url="https://github.com/${_pkgauthor}/${pkgname}"

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a71449e89a0612d940e325fb26023bb298c82ff12685ce83f695ed54e7a9a16')

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
