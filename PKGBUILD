# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
_npmver=3.11.0
pkgname=nodejs-azurite3
pkgver=3.11.0
pkgrel=1
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
b2sums=('62aad6e896ba13d4c3a89a405a81e6806c975ab255adafe0f1200cc998ffa5825f5c8c8b7309269ea1ad543ab03b54d9cb80010a72aa1810cac806a528165813')

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
