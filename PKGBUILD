# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=0.2.2
pkgrel=1
pkgdesc="Hetzner Dynamic DNS Daemon"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0507f0a3c20530ebfc0e07cc086c64a889e095b86503c714393d60135aeea9f3')
backup=("etc/${pkgname}.conf")

prepare() {
	find "${pkgname}-${pkgver}" -maxdepth 1 -type f \
		-exec sed -i 's:/usr/local/etc:/etc:g' {} \; \
		-exec sed -i 's:/usr/local:/usr:g' {} \;
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix="${pkgdir}" install systemd
}
