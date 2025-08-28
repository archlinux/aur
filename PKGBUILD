# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=vtracer
# [2025-07-23]: The version is actually 0.6.11 but the GitHub releases vs tags vs actual file version(==PyPI version) is all over the place
#               Sent an email off to the maintainer about it
pkgver=0.6.5
pkgrel=1
pkgdesc="Convert PNG to SVG"
arch=(x86_64)
url="https://github.com/visioncortex/vtracer"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visioncortex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a2e927a3cc4e8e3440862aeaef3d6d2c867c6557b270a55291fe1e6ae9706444')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/vtracer "${pkgdir}/usr/bin/vtracer"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
