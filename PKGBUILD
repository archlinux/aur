# Maintainer: Filip Parag <filip@parag.rs>
pkgname=hetzner_ddns
pkgver=0.1.1
pkgrel=1
pkgdesc="Dynamic DNS daemon for Hetzner DNS"
arch=('any')
url="https://github.com/filiparag/hetzner_ddns"
license=('BSD')
makedepends=('make')
depends=('awk' 'curl' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e20f2650e70f21861687ef14b042a512ab119c5df0f87cdb216e19389a931cc4')
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
