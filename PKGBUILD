# Contributor: Artem Herasymchuk <artemh@gmail.com>
_npmname=uglify-js
pkgname=nodejs-uglify-js
pkgver=2.8.4
pkgrel=1
pkgdesc="JavaScript parser, mangler/compressor and beautifier toolkit"
arch=('any')
url="https://github.com/mishoo/UglifyJS2"
license=('BSD-2-Clause')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  sed -i -e "s|$pkgdir||" "$pkgdir/usr/lib/node_modules/uglify-js/package.json"
  for f in $pkgdir/usr/lib/node_modules/uglify-js/node_modules/*/package.json; do
    sed -i -e "s|$pkgdir||" "$f"
  done
}
sha256sums=('46ab8d3c0ea707ddc99dfbc92061cc2bf9b0770929358c5e8b664dbc6947c2c0')
