# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=0.2.0
pkgrel=1
pkgdesc="Hetzner Dynamic DNS Daemon"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7d99213dc217dc3d930c68fb411632027ed60f010dd97f42c08c662708299754')
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
