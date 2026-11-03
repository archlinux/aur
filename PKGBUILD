# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=shlink-web-client
pkgver=4.9.0
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/shlinkio/shlink-web-client"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shlinkio/shlink-web-client/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('60e8eeec89c9bef92af6e92bea0c441c8a71b6cb79c5ebe74a4455ff98b92d8cfd2a2ef5ee939f94b1f105736441364da21c78680bfd0b2a0b618bf2c5cbc6f4')

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
