# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.2.8.3
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
source=("${pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2bbf9522a99c738a1bb83f9fa4a4a5203a4a17ead21cae5616bb457f306c926b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.debian
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.debian install
    install -dm0755 "${pkgdir}/usr"
    cp -rv bin "${pkgdir}/usr"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
