# Maintainer: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.10.2
pkgrel=2
pkgdesc="A free and open source uptime monitoring solution"

arch=('any')
url="https://github.com/louislam/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-dist-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/dist.tar.gz"
  "uptime-kuma.service"
)

sha256sums=('30901f70cf6e886c5d1bb544dd6f6b19ecb5311f7d13cbcb896db09a11320c69' '7c8aad01a94fef72192b8ed7993d3586ab9386822e6fb51d313f3eb279022e7e' '84ec5db5532ee2e218bc995ef1c04b7a4b9ebe4df198bba99fd031d6b9073796')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
  mv "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
