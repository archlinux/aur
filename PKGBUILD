# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=0.2.4
pkgrel=1
pkgdesc="Hetzner Dynamic DNS Daemon"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a1fa76de0f7ca5d9f5fdb8da75c47b97b69fad501516824ebe91480025d15b3c')
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
