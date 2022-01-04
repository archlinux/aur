# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.2.8.1
pkgrel=2
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=('any')
url="https://github.com/gnbdev/opengnb"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
optdepends=()
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e850a22a35bb243ad20eabd4a2480316f8f60620966112814d6351dfe9cc6159')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.linux install
    install -dm0755 "${pkgdir}/usr"
    cp -rv bin "${pkgdir}/usr"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
