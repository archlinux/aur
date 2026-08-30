# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG userspace implementation (Go) — AWG 3.1"
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=3.1.20260828
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: tools for configuring AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d1c5579f4cc9e5b47ef3903bd95f84074cc4cbf0638c5598d32f25ef80fdf9bc30a7006c6f80890d38c36b0333a9009554bae2edc08bfb27c38252f9ae73d73f')

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
