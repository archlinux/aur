# Maintainer: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.23.11
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

b2sums=('a8b10341206898b86620d775f128fcc39cdfbcf486706d6b398a883284fa72ec553a41b995fd3d5912ddde14acaa8a3d94998475856b3f62da342bc356563a1f'
        'e052a449f443d06051f1ba249bed661849407dd85eee9bdb8cf2e47b9ba7f40625c1808fe801b50baa144cae14b6188bf6e06222f2029f16ef462a4849562d46'
        'dbeac93f20082847cffc991224df2ac85963a03a02898b06b8444d4f33b2f4a51323bdcd2c940df41d1c8beed1e2b75fa449cff7d80dd9d5213f627bbe409f90')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz --cache npm-cache

  cp --recursive "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
