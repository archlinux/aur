# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=esbuild
pkgver=0.7.17
pkgrel=1
pkgdesc="An extremely fast JavaScript/TypeScript bundler and minifier"
arch=(any)
url="https://github.com/evanw/esbuild"
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

sha256sums=('9215c1745c9e520020123b69aba3e2cf90aeac4cf804c6e51f3a28761dcf6673')
