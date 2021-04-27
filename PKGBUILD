# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wikibase-cli
pkgver=15.10.5
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
sha256sums=('1ce6549c49e6100e90a55ba68f1d1cbdb0bc474909e2b1cb11781b7145277cc3')
