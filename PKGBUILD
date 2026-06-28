# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=netbird-dashboard
pkgver=2.90.0
pkgrel=1
pkgdesc="This project is the UI for NetBird's Management service."
arch=('any')
url="https://github.com/netbirdio/dashboard"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('AGPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/dashboard/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('060c922ae7acb21acbb403708b22c84c22aa9ab17e14710fb622bb79ba15f31f7f7d5ede5f9cc90563e0f8b6ae6267b22f08928000fc4b0db608e5878eb1b7a3')

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
