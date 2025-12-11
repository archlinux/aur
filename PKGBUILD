# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=highlightjs
pkgver=11.10.0
pkgrel=1
pkgdesc='Syntax highlighting for the web (highlight.js JavaScript library)'
arch=('any')
url='https://highlightjs.org'
license=('BSD-3-Clause')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/highlight.js/-/highlight.js-$pkgver.tgz")
noextract=("highlight.js-$pkgver.tgz")
sha256sums=('SKIP')  # replace with real sum via updpkgsums

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/highlight.js-"$pkgver".tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/highlight.js/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
