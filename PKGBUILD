# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.2.8.4
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
sha256sums=('a0fc198dcc82f850c04eba179c668fb6182f920ae73626f6e8aee7bc3796cae4')

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
