# Maintainer: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.11.1
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

sha256sums=('2716e4d8dd62ffc7d7e3dcc1fdf54b1e2b67519c166118a27ec61a15fd2a8438' '085c84c554d457d8dcf1f4b35b68fe9fc2f7883718c1acdda49f5843091bc9e8' '84ec5db5532ee2e218bc995ef1c04b7a4b9ebe4df198bba99fd031d6b9073796')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
  mv "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
