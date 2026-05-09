# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=headscale-ui
pkgver=2026.03.17
pkgrel=1
pkgdesc="A web frontend for the headscale Tailscale-compatible coordination server"
arch=('any')
url="https://github.com/gurucomputing/headscale-ui"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gurucomputing/headscale-ui/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('709c6fa0c6b5ff5bbb71947baf2fdc9a217498ada81926cca2193442cb312a1cf9b4d48e87294dee28e2a92617811388716e56de838313a715396f80ff21c1d7')
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
