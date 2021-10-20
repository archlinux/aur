# Maintainer: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.9.1
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

sha256sums=(
  '56ebf1c9c71ece38e6a8338d21b0cbe135605a6f10ff0d71d82c6bcfa0633559'
  '470dcd58d07a0adfce1ac3af79496a9b9ccb2af9bbd9e3441b89b54bd5299fea'
  '84ec5db5532ee2e218bc995ef1c04b7a4b9ebe4df198bba99fd031d6b9073796'
)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
  mv "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
