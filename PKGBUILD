# Maintainer: M0Rf30

pkgname=pump.io
pkgver=4.1.2
pkgrel=1
pkgdesc="This is pump.io. It's a stream server that does most of what people really want from a social network"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs-lts-boron' 'graphicsmagick')
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

msg2 "Installing systemd service"
  install -Dm755 -d "$srcdir/$pkgname-$pkgver/$pkgname\@.service" "${pkgdir}/usr/lib/systemd/system/"
  install -Dm755 -d "$pkgname.json.sample" "$pkgdir/etc/$pkgname.json"
  rm -rf $pkgdir/usr/etc
}

md5sums=('27235551c29b90240cc98ce3604e34e2')
