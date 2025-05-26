# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=headscale-ui
pkgver=2025.05.22
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/gurucomputing/headscale-ui"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gurucomputing/headscale-ui/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('547b028040919bcf4df012fd8e9b7c46c9a4e33649b6b7aa9e25103990605214655ba2b7e86dfa5c74c151d1953e2a88be27dc5feb4b52d5b8ea6abe84882a44')
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
