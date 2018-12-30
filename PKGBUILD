# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=autogit
pkgver=1.2.6
pkgrel=1
pkgdesc="Define commands, using plugins, to execute across all your repositories."
arch=(any)
url="https://github.com/fabiospampinato/autogit#readme"
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

sha256sums=('b6ac9aeab820a7d9d124762412b900fabc4d3266ebcf909fb0e2f9580d5f505a')
