# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
_npmver=3.13.1
pkgname=nodejs-azurite
pkgver=3.13.1
pkgrel=1
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
b2sums=('f2e5e895455d15ef301b559091b74cfa497ac1c0f8247a9b23253289236fd0ff20b8e3b2dc240c361590602a7bfc6cee0511fa64d8687bcab3ac437b2dd5d390')

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
