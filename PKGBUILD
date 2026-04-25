# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=resyctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Automation-friendly Resy command-line client"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/resyctl"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('627acb57f6f70bcbe042e777a5e3dabb280dbab6ac57c672e25b17f19c64c46f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/resyctl "${pkgdir}/usr/bin/resyctl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
