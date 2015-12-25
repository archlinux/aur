_npmname=sinopia
_npmver=1.4.0
pkgname=nodejs-sinopia # All lowercase
pkgver=1.4.0
pkgrel=1
pkgdesc="Private npm repository server"
arch=(any)
url="https://github.com/rlidwka/sinopia"
license=()
depends=('nodejs' 'npm')
install=nodejs-sinopia.install
source=( http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz
         sinopia.service
         nodejs-sinopia.install )
noextract=($_npmname-$_npmver.tgz)
sha1sums=( 36bf5209356facbf6cef18fa32274d116043ed24
           a96ee3c3407e70a22bef11d42f0f3b393eefc1ae
           9cb284b9f22894a6f2cd465156d9ed9f5c1c8776 )

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir

  npm install -g --prefix "$pkgdir/usr" $_npmname-$_npmver.tgz

  rmdir "$pkgdir/usr/etc"

  install -Dm644 sinopia.service "$pkgdir/usr/lib/systemd/system/sinopia.service"
  install -Dm644 sinopia.service "$pkgdir/usr/lib/systemd/user/sinopia.service"
}

# vim:set ts=2 sw=2 et:
