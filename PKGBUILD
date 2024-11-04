# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=azurite
pkgname=nodejs-azurite
pkgver=3.32.0 # renovate: datasource=github-tags depName=Azure/Azurite
pkgrel=2
pkgdesc="A lightweight server clone of Azure Storage that simulates most of the commands supported by it with minimal dependencies"
arch=(any)
url="https://github.com/azure/azurite"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
b2sums=('6571dcdc7323ff244e76dfc6c46bc165ef4d959c8ebdb806100a035b0214ebec4cc0aeaa0c468e30cabfbf70e91aa8fb2a7812ae7c5a13440cfd7a3d0e09f451')
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
