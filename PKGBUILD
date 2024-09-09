# shellcheck shell=bash
# Maintainer: Chinmay Dalal <dalal dot chinmay dot zero one zero one at gmail dot com>
pkgname=i3bar-river
pkgver=0.1.10
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
b2sums=('bdc0465c12d5346b5483821dbabb221088fadbbc6b7b9babcdf4383f6e2b83e1aa0766ecde2c03a2aa10138e2730446e32ecaaf672e916dd4701a625b9060b6f')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo check
}
