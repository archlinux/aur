# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=resyctl
pkgver=0.2.3
pkgrel=1
pkgdesc="Automation-friendly Resy command-line client"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/resyctl"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85b2ba0337647831d9d34de51eb5de789c9e28ea57d5e8b43142bc544e4b0342')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/resyctl "${pkgdir}/usr/bin/resyctl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
