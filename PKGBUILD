_npmname=verdaccio
_npmver=3.11.6
pkgname=verdaccio
pkgver=3.11.6
pkgrel=1
pkgdesc="Private npm repository server"
arch=(any)
url="https://github.com/verdaccio/verdaccio"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
# noextract=($_npmname-$_npmver.tgz)
sha256sums=('f9a699b14e6e24cf7158c6920d7de2614d83a9fa4d8444f89f5718113a4590c6')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$srcdir"/package/systemd/verdaccio.service "$pkgdir"/usr/lib/systemd/system/verdaccio.service
}
