# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=wikibase-cli
pkgver=15.16.6
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
sha256sums=('0c9ac7ef2b73b3d5d0d5db7285e10b947f6140ae72649a8722be75b7293b90b8')

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
