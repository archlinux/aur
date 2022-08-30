# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
pkgname=nodejs-azurite
pkgver=3.19.0 # renovate: datasource=github-tags depName=Azure/Azurite
pkgrel=1
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
b2sums=('74d8400b23f558b31c82a7e6b33a117c4a2f35b217f35a2c8351db76a8646d46e63b29c8e15b35a14e38474a1119eaf953365bbf0be4bebdde67217235ed9255')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
