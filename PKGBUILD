# shellcheck shell=bash
# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname=i3bar-river
pkgver=1.0.1
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
b2sums=('d9626cdecff8cc66105f5191cfee52d4e9c7347528a1a55470567a58770ad825318dd004652840b48225a264285f7d954b542b68e5b61bfc365b21f2b44a77ae')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo check
}
