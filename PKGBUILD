# Maintainer: Ivan  <vantu5z@mail.ru>

pkgname=wireproxy
pkgver=1.0.3
pkgrel=2
arch=(x86_64)
license=(ISC)
url="https://github.com/octeep/wireproxy"
pkgdesc="Wireguard client that exposes itself as a socks5 proxy"
depends=()
makedepends=('go')
source=("https://github.com/octeep/wireproxy/archive/refs/tags/v${pkgver}.tar.gz"
        "wireproxy.service"
        "wireproxy-user.service")
sha256sums=('108175bff7e5158236acdd2a0b1fc129a799a52772885b8e835c5e84d24a7358'
            '0391264097b317d72e6286c700f9616bf094c8ad937ad4ba5988aa4713404ca0'
            '8c40908924c46be21c9a0b462a632ac1aa4a51aa0b9b028d9bb015091a98e77e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build ./cmd/wireproxy
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 "wireproxy" "${pkgdir}/usr/bin/wireproxy"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0755 "../wireproxy.service" "${pkgdir}/usr/lib/systemd/system/wireproxy.service"
  install -Dm0755 "../wireproxy-user.service" "${pkgdir}/usr/lib/systemd/user/wireproxy.service"
}
