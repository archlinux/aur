# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=netbird-dashboard
pkgver=2.39.0
pkgrel=1
pkgdesc="This project is the UI for NetBird's Management service."
arch=('any')
url="https://github.com/netbirdio/dashboard"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('AGPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/dashboard/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cc4af92a0872a551b496d6d0e54a50d1cbb2a465106bfc8d5ccfbde81b5e127d88d1d9832c8ee4d4f946f533bb0d1aafb73a62b4bcdfd60df3ef2c874670d9d4')

build() {
  cd "dashboard-$pkgver"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -r ${srcdir}/dashboard-$pkgver/out/* ${pkgdir}/usr/share/webapps/${pkgname}/
  install -Dm0644 ${srcdir}/dashboard-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
