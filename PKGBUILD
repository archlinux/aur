# Maintainer: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.23.3
pkgrel=1
pkgdesc='A fancy self-hosted monitoring tool'

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
noextract=("${pkgname}-${pkgver}.tar.gz")

b2sums=('e273dd8b880d141b4f2b231df9fc0a7ff58853b19af17ca03c8a5a18bf634327743672befb1b00b97abd57ed684c9d885d11925026ecac32dc518c189a9de5cc'
        'd1f937e1d665c9989153f21c8350da92fd60d28c741e92cbaf91d76eb0bdd2a1c224b66e6da8d2d2f0d3b6eb20a28ddc2efd5d5a48818f5342380b2e295f3e6e'
        'dbeac93f20082847cffc991224df2ac85963a03a02898b06b8444d4f33b2f4a51323bdcd2c940df41d1c8beed1e2b75fa449cff7d80dd9d5213f627bbe409f90')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz --cache npm-cache

  cp --recursive "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
