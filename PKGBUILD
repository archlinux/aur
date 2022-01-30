# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=wikibase-cli
pkgver=15.16.4
pkgrel=1
pkgdesc="Command-line interface to Wikibase instances"
arch=('any')
url="https://github.com/maxlath/wikibase-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
replaces=('nodejs-wikibase-cli')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('b502d62fcef6183836550aac32631a3e190d45f12a57404a5d961be9913e7b66')

package() {
  export NODE_ENV=production

  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    --build-from-source \
    "$pkgname-$pkgver.tgz"

  chown -R root:root "$pkgdir/"

  install -d $pkgdir/usr/share/{licenses,doc}/$pkgname/

  ln -s \
    /usr/lib/node_modules/wikibase-cli/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -s \
    /usr/lib/node_modules/wikibase-cli/README.md \
    "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
