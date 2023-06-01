# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Asuka Minato

pkgname=lebab
pkgver=3.2.1
pkgrel=1
pkgdesc="Turn your JavaScript ES5 code into readable ES6/ES7"
arch=(any)
url="https://github.com/mohebifar/lebab"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  install -Dm755 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
sha256sums=('b5af8dc4b2917869a02f5525269b4891e66902315b021adbef1e15ee6599751e')
