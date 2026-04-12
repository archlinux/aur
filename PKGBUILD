# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=things3-cloud
pkgver=0.7.3
pkgrel=1
pkgdesc="Command-line client for Things 3 using the Things Cloud API"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/things3-cloud"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
conflicts=('things3-cloud-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65facfefc321ca667cb575ca8354c6aab49dbaf4fd92bfa115630d1d4074b96a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/things3 "${pkgdir}/usr/bin/things3"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
