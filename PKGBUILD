# Maintainer: robertfoster

pkgname=pump.io
pkgver=5.1.1
pkgrel=1
pkgdesc="A stream server that does most of what people really want from a social network"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs' 'graphicsmagick')
optdepends=('mongodb' 'redis')
provides=('pumpio')
conflicts=('pumpio-git' 'pumpio')
install=${pkgname}.install
backup=(etc/webapps/$pkgname/$pkgname.json)
source=(https://github.com/pump-io/pump.io/archive/v$pkgver.tar.gz)

package() {
cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver 
  npm prune --production

msg2 "Installing systemd service"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  install -Dm755 -d "$pkgname.json.sample" "$pkgdir/etc/$pkgname.json"
  rm -rf $pkgdir/usr/etc
}

md5sums=('8ecae3256a522f91ad3328ce3181c13f')
