# Maintainer: M0Rf30

pkgname=pump.io
pkgver=0.3.0
pkgrel=2
pkgdesc="This is pump.io. It's a stream server that does most of what people really want from a social network"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs' 'graphicsmagick')
optdepends=('mongodb' 'redis')
provides=('pumpio')
conflicts=('pumpio-git' 'pumpio')
install=${pkgname}.install
backup=(etc/webapps/$pkgname/$pkgname.json)
source=(https://github.com/e14n/pump.io/archive/v$pkgver.tar.gz
        $pkgname.service
        $pkgname.json
        $pkgname)

build() {
  cd $srcdir/$pkgname-$pkgver
  export PYTHON=/usr/bin/python2
  npm install
  npm install databank-mongodb
  npm install databank-redis
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/webapps/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/etc/webapps/$pkgname/
  install -Dm755 pump.io $pkgdir/usr/bin/pump.io
  cp -r $pkgname-$pkgver $pkgdir/usr/share/webapps/$pkgname
  cp $pkgname.json $pkgdir/etc/webapps/$pkgname/$pkgname.json
  cp $pkgname.service $pkgdir/usr/lib/systemd/system/
}

md5sums=('fdc06c33645594049eaab481af133f75'
         'dcfd7c74792755996d0d9589bfaf6747'
         'd072eb2d992586e013c06c64786fc4ca'
         '067b3c2fee9cef8a596bac9e9d89ae75')
