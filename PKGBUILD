_npmname=verdaccio
_npmver=4.2.0

pkgname=$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Private npm repository server"
arch=(any)
url="https://github.com/verdaccio/verdaccio"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('aa1e77bf4d9e88f950f480532d0bd0ef88d7f3dce058af9770d53fd760e27f5c')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --registry https://registry.npmjs.org/ --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$srcdir"/package/systemd/verdaccio.service "$pkgdir"/usr/lib/systemd/system/verdaccio.service
  install -Dm644 "$srcdir"/package/conf/default.yaml "$pkgdir"/etc/verdaccio/config.yaml
}
