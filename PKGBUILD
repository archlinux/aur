# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
pkgname=nodejs-azurite
pkgver=3.17.1 # renovate: datasource=github-tags depName=Azure/Azurite
pkgrel=1
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
b2sums=('e71c29775d04916ccc04d0e3253a9e058458542b5e0145bc6cb0be2f032e189c751fe36d5040356b40481437e6ab00eab8f8bcfa9275fdb45d9fa0bed6a2b5b4')

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
