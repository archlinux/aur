# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=1.0.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('MIT')
depends=('docker')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('82b9cd7f3578ffbfae306b6bbb61ccf08dfc3b11a9e8f426ac1f04ca82db753c')
conflicts=(zeus-bin)

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make BUILD_TYPE=release build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -Dm755 target/release/zeus "$pkgdir"/usr/bin/zeus
	install -Dm644 builder.tar.gz "$pkgdir"/usr/share/zeus/builder.tar.gz
	mkdir -p "$pkgdir"/var/cache/aur
	chmod 0777 "$pkgdir"/var/cache/aur
}
