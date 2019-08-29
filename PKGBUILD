# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=rollup
pkgver=1.20.3
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

sha256sums=('ed00e3fc7c7d06a149284ccb44e38cb2b449fee052aab822d96ba03d58b23500')
