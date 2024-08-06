# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=0.2.5
pkgrel=1
pkgdesc="Hetzner Dynamic DNS Daemon"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ee748e872508a5b7d77956b120e2db74450b272040bee9986e0c71f80e793565')
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
