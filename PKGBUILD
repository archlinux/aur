# Maintainer: Evan Purkhiser <resyctl.aur@evanpurkhiser.com>

pkgname=resyctl
pkgver=0.2.4
pkgrel=1
pkgdesc="Automation-friendly Resy command-line client"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/resyctl"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90a69d47a7111843c55152bc2083bb7656eebe2205e428b4cb169d299e0b8685')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/resyctl "${pkgdir}/usr/bin/resyctl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
