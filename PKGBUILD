# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=shlink-web-client
pkgver=4.2.0
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/shlinkio/shlink-web-client"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shlinkio/shlink-web-client/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('57e006a942e26abfc10432e04e9f02663e79ebab4d76a2b7f233b35ff32dff50befc238c0a6d727a958c9cad99340e65b18b06176a192b7259d3beba1dd1ea0f')

build() {
  cd "$pkgname-$pkgver"
#  if you need to change homepage location:
#  sed -i 's,"homepage": "","homepage": "/shlink",g' package.json
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/shlink-web-client/"
  cp -r ${srcdir}/$pkgname-$pkgver/build/* ${pkgdir}/usr/share/webapps/shlink-web-client/
}
