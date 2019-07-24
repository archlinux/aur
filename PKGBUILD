_npmname=verdaccio
_npmver=4.1.0

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
sha256sums=('37a7d5747a3396729995e23732221477744986e1e6dff843a3422db9e006c987')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --registry https://registry.npmjs.org/ --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$srcdir"/package/systemd/verdaccio.service "$pkgdir"/usr/lib/systemd/system/verdaccio.service
  install -Dm644 "$srcdir"/package/conf/default.yaml "$pkgdir"/etc/verdaccio/config.yaml
}
