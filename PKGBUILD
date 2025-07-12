# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=headscale-ui
pkgver=2025.07.12
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/gurucomputing/headscale-ui"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gurucomputing/headscale-ui/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('584d46a6fe1bb0e13d73be2a11318d076e883af0c46aacd7ba453884f1c5e87e1d2053908edac4b67e5e38b24fc528f0b7c22e03f1c69f58aeaf71fa29b6c330')
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
