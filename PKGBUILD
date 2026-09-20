# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=headscale-admin
pkgver=0.28.0
pkgrel=1
pkgdesc="headscale-admin is meant to be a simple, modern, and useful web interface for juanfont/headscale - An open source, self-hosted implementation of the Tailscale control server."
arch=('any')
url="https://github.com/GoodiesHQ/headscale-admin"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoodiesHQ/headscale-admin/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d02f51b37e8683cbc55242bdb1a05e44cdbc39663dca4e09326db079fdcd51c33e4409f82617a551d909291933376ed62c67587a55f1b58e0dd1be43465f4d7f')
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"
  # edit ENDPOINT of you want use another path
  set ENDPOINT=/admin
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/headscale-admin/"
  cp -r ${srcdir}/$pkgname-$pkgver/build/* ${pkgdir}/usr/share/webapps/headscale-admin/
  install -Dm0644 ${srcdir}/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
