# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
_npmver=3.13.0
pkgname=nodejs-azurite3
pkgver=3.13.0
pkgrel=1
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
b2sums=('795f3e1388abdb9785829461b6a607c8b164a360a18b8855e11a81aa771ce3eb046460dc603063c6c1b54226c8890e80bd6af25957c4a48e21d7ea638842195c')

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
