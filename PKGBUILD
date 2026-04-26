# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=netbird-dashboard
pkgver=2.37.1
pkgrel=1
pkgdesc="This project is the UI for NetBird's Management service."
arch=('any')
url="https://github.com/netbirdio/dashboard"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('AGPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/dashboard/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7f74b205d9b9febf85512074fe3c1470f84869c99f8d5bdac626f849e59ee105cf528b9e3dd223d0c209d6a64bc3392d3096ac4b7fb64ed50e7c79738cdcd24c')

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
