# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wikidata-cli
pkgver=8.0.1
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
sha256sums=('a5609f02a64346e8e9eb469921f4e10e49ba0579a4e95b60b1ee437b81ab9d1a')
