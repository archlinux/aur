# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wikidata-cli
pkgver=7.4.1
pkgrel=1
pkgdesc="The command-line interface to Wikidata"
arch=(any)
url="https://github.com/maxlath/wikidata-cli#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
replaces=('nodejs-wikidata-cli')

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
sha256sums=('7fd4e7b6a8bb7235dfc09708557b8963fe3dd227a1a9a1d133cbe85ef82303d7')
