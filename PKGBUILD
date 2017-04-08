# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=etoys
pkgver=5.0.2408
pkgrel=1
pkgdesc="Educational tool and media-rich authoring environment for teaching children"
arch=('any')
url="http://squeakland.org/"
license=('Apache' 'MIT')
depends=('squeak-vm')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/$pkgname/$pkgname-$pkgver.tar.gz
        etoys.desktop)
sha256sums=('65e89d6367fd9ac6a7ef9b017922510dcfcbd13c6f1417c7e6672877559c4f4f'
            'cf9a73302eb9c69177e190a90714477f5fed8a478a5513256ac92f1b0b397774')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' setup.py
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $pkgname-$pkgver
  make ROOT="$pkgdir" install-etoys

  install -Dm644 ../etoys.desktop "$pkgdir/usr/share/applications/etoys.desktop"
  install -Dm644 activity-etoys.svg "$pkgdir/usr/share/pixmaps/etoys.svg"
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../doc/etoys/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
