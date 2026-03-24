# Maintainer: dougEfresh <dchimento@gmail.com>
_npmname=@pulumi/mcp-server
_npmver=0.2.0
pkgname=pulumi-mcp-server
pkgver=0.2.0
pkgrel=1
pkgdesc="A server implementing the Model Context Protocol for Pulumi."
arch=(any)
url="https://www.pulumi.com/docs/iac/using-pulumi/mcp-server/"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=()
provides=("pulumi-mcp-server")
source=(https://registry.npmjs.org/@pulumi/mcp-server/-/mcp-server-0.2.0.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('33d484e816a3b5198cfd957e4ae7fffaceeb5a9affd1c0ecf39a8893e7cd88ae')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  # Fix hardcoded cache directory to use XDG_CACHE_HOME or /tmp
  sed -i 's/__dirname2,/process.env.XDG_CACHE_HOME || "\/tmp", "pulumi-mcp-server",/' "$pkgdir/usr/lib/node_modules/@pulumi/mcp-server/dist/index.js"
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
