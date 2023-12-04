# Maintainer: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.23.8
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

b2sums=('9b5c25eb8cdf4cad1addc65a37f314b2793bc03b5b9ac09f5950adf2461b5dc10d448bc9d8fa839f68cb7c26140c68a611c1d4c55b2fdf6b6f22803d13caf566'
        '61367caa66030259958917eb7894813b27105a379bb8ab5f764ffb6cfd9116f8bd6e0e466441d51a37d3f1fdae64cb00fa797be9abbadf6087b1103762569901'
        'dbeac93f20082847cffc991224df2ac85963a03a02898b06b8444d4f33b2f4a51323bdcd2c940df41d1c8beed1e2b75fa449cff7d80dd9d5213f627bbe409f90')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz --cache npm-cache

  cp --recursive "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
