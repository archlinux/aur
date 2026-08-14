# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG userspace implementation (Go) — AWG 3.1"
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=3.1.20260814
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: tools for configuring AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a2f7c03def872160df18a0df171e41d03d96a9f2867d4d54d3b4b2a133d64ea2b56149a3bca26eb457e71783d33d3d958328051a04f7a40273cdd676a0a01bde')

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
