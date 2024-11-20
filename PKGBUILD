# shellcheck shell=bash
# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname=i3bar-river
pkgver=1.1.0
pkgrel=1
pkgdesc="A port of i3bar for river"
url="https://github.com/MaxVerevkin/i3bar-river"
arch=('x86_64')
license=('GPL3')
depends=(cairo pango)
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://github.com/MaxVerevkin/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f5c013b5d290aee440ee37d694750fc80b7c2e9d201b426ec84bbb87bf96d9d5f4b47960ebb92e34ab2612ea5e8b790235e32bd6035c890f687e083fbb51f604')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo check
}
