# Maintainer: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.12.1
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

sha256sums=('fe7b5948274896dcd63fde9ac5c17ca0d465692ec347d37c414e076820d18cda' 'e22b23994b70c6b82a35df617e84dee1178cf5d3b4acc8ab89d292bbaba0fcf4' '84ec5db5532ee2e218bc995ef1c04b7a4b9ebe4df198bba99fd031d6b9073796')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
  mv "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
