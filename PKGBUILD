# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
pkgname=nodejs-azurite
pkgver=3.25.0 # renovate: datasource=github-tags depName=Azure/Azurite
pkgrel=2
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
b2sums=('3032b53000616d196a0c334925e554b5c4d9a1fe80e1ca74c58c61d9de61f5565a71fb28b97af84780f7a93ec79bebbcf2fbf22c06e52b73a0a1ae31d554ed43')
options=('!strip')

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
