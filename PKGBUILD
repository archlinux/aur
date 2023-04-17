# Maintainer: bgh <aur at bgh dot io>
# Contributor: Sylvain Durand <arch@durand.tf>

pkgname=uptime-kuma
pkgver=1.21.2
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
noextract=("${pkgname}-${pkgver}.tar.gz")

sha256sums=('f0fed73cad26eb89c26555cfd202edeacd5a22baba09e71c0d89b0f8783ec10c'
            'b12c283d9bb029d9d968c81b535b2f49f346b3fe37fca807a45c87ab0d529b3f'
            '84ec5db5532ee2e218bc995ef1c04b7a4b9ebe4df198bba99fd031d6b9073796')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
  chown --recursive root:root "${pkgdir}"

  cp --recursive "$srcdir"/dist "$pkgdir"/usr/lib/node_modules/$pkgname/
  install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
}
