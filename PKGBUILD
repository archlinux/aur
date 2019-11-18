# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wikibase-cli
pkgver=8.1.2
pkgrel=1
pkgdesc="The command-line interface to Wikibase (Wikidata)"
arch=(any)
url="https://github.com/maxlath/wikibase-cli#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
replaces=('nodejs-wikibase-cli')
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  install -Dm755 "$_npmdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
sha256sums=('f4d0ec0fec59476749ef086e462b9a05a3f903196292eb16b5923b5a37b767ac')
