# Maintainer: M0Rf30

pkgname=pump.io
pkgver=2.1.1
pkgrel=1
pkgdesc="This is pump.io. It's a stream server that does most of what people really want from a social network"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs6-bin' 'graphicsmagick')
optdepends=('mongodb' 'redis')
provides=('pumpio')
conflicts=('pumpio-git' 'pumpio')
install=${pkgname}.install
backup=(etc/webapps/$pkgname/$pkgname.json)
source=(https://github.com/e14n/pump.io/archive/v$pkgver.tar.gz)
build() {
  cd $srcdir/$pkgname-$pkgver
#  export PYTHON=/usr/bin/python2
  npm install
  npm install bunyan
  npm install databank-mongodb
  npm install databank-redis
  npm prune --production
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/webapps/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/etc/webapps/$pkgname/
  cp -r ../$pkgname-$pkgver $pkgdir/usr/share/webapps/$pkgname
  cp $pkgname.json.sample $pkgdir/etc/webapps/$pkgname/$pkgname.json
  cp $pkgname.service.sample $pkgdir/usr/lib/systemd/system/$pkgname.service
  cp -r bin $pkgdir/usr
}

md5sums=('5ec91d6963b8db05f33c72f9e7d03813')
