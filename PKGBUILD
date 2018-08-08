# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=rollup
pkgver=0.64.1
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

sha256sums=('fe8aff3c0ac89cb85800894bb067a1ca4537dfa18d62d61c18090687887a3164')
