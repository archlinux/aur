# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=webpack
pkgver=4.35.0
_cliver=3.3.4
pkgrel=1
pkgdesc="JavaScript bundler (CommonJs, AMD, ES6 modules, CSS, Images, JSON, CoffeeScript, LESS)"
arch=(any)
url="https://webpack.js.org/"
license=(MIT)
depends=('nodejs')
optdepends=()
makedepends=('npm')
replaces=('nodejs-webpack')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
    https://registry.npmjs.org/$pkgname-cli/-/$pkgname-cli-$_cliver.tgz)
noextract=($pkgname-$pkgver.tgz $pkname-cli-$_cliver.tgz)
sha256sums=('167e9750086fa8944c95030d76922ebf32b28bc86a9c781cc256ae2f5276d71a'
            'a62c5f0836f3a8f66bbaea806c7230af8f46f8c101031a03ed8c4fb5f7d3e8d1')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  npm install -g --prefix "$pkgdir/usr" $pkgname-cli@$_cliver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  install -Dm755 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
