# Maintainer: Evert Vorster <superchief@evertvorster.com>
pkgname=highlightjs
pkgver=11.11.1            # update to whatever is current on npm
pkgrel=1
pkgdesc='Highlight.js prebuilt browser assets (JS + themes)'
arch=('any')
url='https://highlightjs.org'
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/@highlightjs/cdn-assets/-/cdn-assets-$pkgver.tgz")
noextract=("cdn-assets-$pkgver.tgz")
sha256sums=('28a06bf6ebcc2218c6e842bdb4f1c8353508a8cada59e85110f91892f5726195')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/cdn-assets-"$pkgver".tgz

  # npm installs package.json owned by build user
  chown -R root:root "$pkgdir"

  install -Dm644 \
    "$pkgdir/usr/lib/node_modules/@highlightjs/cdn-assets/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
