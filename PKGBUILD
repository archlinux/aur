# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
_npmver=2.7.0
pkgname=nodejs-azurite
pkgver=2.7.0
pkgrel=2
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
b2sums=('71f40437f7cca9b8bf650889ab6bf3ea145d84899adb33b22cd8543dc6bb0c2827af8d0b950ef4791e8bdc72c65d1cb5eda7248b70cca5ae2656b7c6490809d0')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
