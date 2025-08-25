# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=headscale-ui
pkgver=2025.08.23
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/gurucomputing/headscale-ui"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gurucomputing/headscale-ui/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a2e2963be7c24274e40ff60e380cb50d519bb16f1e97232f5aafa18b0ea55886817792e722fdbda3f3aabe4f92e624e69df1745fd698e04f280cd95b42adeca1')
install="$pkgname.install"

build() {
  cd "$pkgname-$pkgver"
  sed -i "s/insert-version/${pkgver}/g" ./src/routes/settings.html/+page.svelte
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/headscale-ui/"
  cp -r ${srcdir}/$pkgname-$pkgver/build/* ${pkgdir}/usr/share/webapps/headscale-ui/
  install -Dm0644 ${srcdir}/$pkgname-$pkgver/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
