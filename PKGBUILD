# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb-git
pkgver=v1.2.8.1.3.g1a2b4c5
pkgrel=1
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=('any')
url="https://github.com/gnbdev/opengnb"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=()
optdepends=()
makedepends=('git')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+https://ghproxy.com/${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make -f Makefile.linux
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make -f Makefile.linux install
    install -dm0755 "${pkgdir}/usr"
    cp -rv bin "${pkgdir}/usr"
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
