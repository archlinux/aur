# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG userspace implementation (Go) — AWG 3.1"
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=3.1.20261116
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: tools for configuring AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c9677eaf3663c744543046d0e42fe0e79168a24cea0c640b0c9eea8a86c0008e931e6a3fa34a68f2c454de2911585b7edc3d3fd61382c69d2628459ec35861c3')

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
