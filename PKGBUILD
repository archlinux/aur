# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=lean-spec
pkgver=0.2.19
pkgrel=1
pkgdesc="Lightweight, flexible Spec-Driven Development (SDD) for modern AI-powered development "
arch=('x86_64' 'aarch64')
url="https://github.com/codervisor/lean-spec"
license=('MIT')
options=('!debug')
makedepends=('pkg-config' 'rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9afa1b81613381204817dd2ef3a902a12b88113b6015aff47e905445cba4d9d1')

build() {
	cd "${srcdir}/lean-spec-${pkgver}/rust"

	cargo build --release -p leanspec-cli
}

package() {
	cd "${srcdir}/lean-spec-${pkgver}/rust"

	# Create directories
	install -dm755 "${pkgdir}/usr/bin"

	# Install the CLI executable
	install -Dm755 "target/release/lean-spec" "${pkgdir}/usr/bin/lean-spec"
}
