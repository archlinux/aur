# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
pkgname=nodejs-azurite
pkgver=3.23.0 # renovate: datasource=github-tags depName=Azure/Azurite
pkgrel=2
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
b2sums=('0edf3dc7340081450450679d689f106e1440d186222405933570123e641c0941fcbaee532976bb82f7309910eb59c10d9b563ecb8f561664f4bd6c9dfc6114a3')
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
