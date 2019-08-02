# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=rollup
pkgver=1.18.0
pkgrel=1
pkgdesc="Next-generation ES6 module bundler"
arch=(any)
url="https://rollupjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('998425832e903f88442b876c4ba7dbf91b7ef9e4a2befa8aa910adb6a55004da')
