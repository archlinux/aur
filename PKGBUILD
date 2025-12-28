# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=netbird-dashboard
pkgver=2.23.1
pkgrel=1
pkgdesc="This project is the UI for NetBird's Management service."
arch=('any')
url="https://github.com/netbirdio/dashboard"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('AGPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/dashboard/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a1c3e452d8184cc10c895c6a63d8b7281d971a0b38a30591056daf3ad49f93ea621aee21daabd222ec153027f37570310e292692562336ec79da8d3a8c8c57fc')

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
