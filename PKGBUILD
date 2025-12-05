# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=1.0.1
pkgrel=1
pkgdesc="Hetzner Dynamic DNS Daemon"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq' 'net-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7531088d7e8a46524192b67494df6e55fd8b3f8aff26c9ce8d11b7e1610f8af9')
backup=("etc/${pkgname}.json")

prepare() {
	find "${pkgname}-${pkgver}" -maxdepth 1 -type f \
		-exec sed -i 's:/usr/local/etc:/etc:g' {} \; \
		-exec sed -i 's:/usr/local:/usr:g' {} \;
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix="${pkgdir}" install systemd
}
