# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=headscale-admin
pkgver=0.25.6
pkgrel=1
pkgdesc="headscale-admin is meant to be a simple, modern, and useful web interface for juanfont/headscale - An open source, self-hosted implementation of the Tailscale control server."
arch=('any')
url="https://github.com/GoodiesHQ/headscale-admin"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoodiesHQ/headscale-admin/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6b21eacb120571017d8459cd3d05f126d0e89c60389ac175a61826ff7acfe7e25709f0fa89b5811b509b7d82834369ed1a6828ddf45dd282c1368fc7bd84d94c')
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/headscale-admin/"
  cp -r ${srcdir}/$pkgname-$pkgver/build/* ${pkgdir}/usr/share/webapps/headscale-admin/
  install -Dm0644 ${srcdir}/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
