# Maintainer: Daichi Shinozaki <dsdseg at gmail dot com>
# Special thanks to: James Henderson
pkgname=datomic
pkgver=0.9.5561
pkgrel=1
pkgdesc="A database of flexible,time-based facts,supporting queries and joins,with elastic scalability,and ACID transactions"
arch=('any')
url=https://my.datomic.com/downloads/free
license=('custom:DatomicFreeEditionLicense')
depends=('java-environment' 'maven')
makedepends=('unzip')
optdepends=('leiningen')
options=(!strip)
install="$pkgname.install"
source=("$pkgname-$pkgver.zip::https://my.datomic.com/downloads/free/$pkgver"
  'transactor.properties'
  $pkgname.service
)
md5sums=('b6852a34960e3083c55141cadef521da'
         '19e8f0692138f52961a584d8f428a306'
         '1a90dced8cf46b36a2a87c666aa3b47b')

package() {
  _pkgname="$pkgname-free-$pkgver"
  mkdir -p $pkgdir/usr/lib/ $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/var/lib/datomic/{data,log}
  install -Dm644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp -r "$srcdir/$_pkgname" "$pkgdir"/usr/lib/datomic
  cp $srcdir/transactor.properties $pkgdir/usr/lib/datomic/config/
  cp $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/
  install -Td $srcdir/datomic $pkgdir/etc/logrotate.d/datomic
}

# vim:set ts=2 sw=2 et:
