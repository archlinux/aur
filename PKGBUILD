# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wikibase-cli
pkgver=8.0.4
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
sha256sums=('c6216b0ac7155b9656d5d5272a8d8795f3b9dc0ccf5198a6a28fe8479e0b94b7')
