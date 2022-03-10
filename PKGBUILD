# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.2.8.5
pkgrel=1
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=('any')
url="https://github.com/gnbdev/opengnb"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=('miniupnpc')
optdepends=()
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('59d111158efcf7b439d04b3cb19e9d08c429f12748d48b15a62f36ddfe668045')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.debian
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.debian install
    install -dm0755 "${pkgdir}/usr"
    cp -rv bin "${pkgdir}/usr"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/scripts/opengnb@.service" "${pkgdir}/usr/lib/systemd/system/opengnb@.service"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
