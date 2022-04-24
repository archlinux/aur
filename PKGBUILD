# Maintainer: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.15.0
pkgrel=1
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

sha256sums=('1578d302fced2a8fcaf4f64a517fbb0fb38a5c4e55fa681723973ea7be4a7225' '03166bcc37ef418bbe450b7c5bfeeb06a755a84f89776fbc87ad3194bfc68b02' '84ec5db5532ee2e218bc995ef1c04b7a4b9ebe4df198bba99fd031d6b9073796')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
  mv "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
