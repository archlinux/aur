# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=1.1.0
pkgrel=1
pkgdesc="Hetzner Dynamic DNS Daemon"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq' 'net-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e2d7afea728686148fabca3f2245cdd541e63b1e09a64cf5a3e642c9c1aa95ff')
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
